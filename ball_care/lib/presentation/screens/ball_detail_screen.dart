import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_constants.dart';
import '../../data/database/database.dart';
import '../../data/providers/providers.dart';
import '../../data/models/maintenance_status.dart';
import '../widgets/progress_ring.dart';
import '../widgets/background_image.dart';

class BallDetailScreen extends ConsumerWidget {
  final String ballId;

  const BallDetailScreen({super.key, required this.ballId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ballRepository = ref.watch(ballRepositoryProvider);

    return StreamBuilder<Ball?>(
      stream: ballRepository.watchBallById(ballId),
      builder: (context, ballSnapshot) {
        if (ballSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final ball = ballSnapshot.data;
        if (ball == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ball Not Found')),
            body: const Center(child: Text('Ball not found')),
          );
        }

        return _BallDetailWithTabs(ball: ball);
      },
    );
  }
}

class _BallDetailWithTabs extends ConsumerStatefulWidget {
  final Ball ball;

  const _BallDetailWithTabs({required this.ball});

  @override
  ConsumerState<_BallDetailWithTabs> createState() => _BallDetailWithTabsState();
}

class _BallDetailWithTabsState extends ConsumerState<_BallDetailWithTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildProgressRings() {
    final ballRepository = ref.watch(ballRepositoryProvider);
    final gameLogRepository = ref.watch(gameLogRepositoryProvider);
    final maintenanceRepository = ref.watch(maintenanceRepositoryProvider);

    // CRITICAL: Use StreamBuilder to watch for changes in logs and maintenance
    // This ensures progress rings update automatically
    return StreamBuilder<List<GameLog>>(
      stream: gameLogRepository.watchLogsForBall(widget.ball.ballId),
      builder: (context, gameLogsSnapshot) {
        return StreamBuilder<List<MaintenanceRecord>>(
          stream: maintenanceRepository.watchMaintenanceForBall(widget.ball.ballId),
          builder: (context, maintenanceSnapshot) {
            // Whenever logs or maintenance change, fetch new statuses
            // Use a key based on data length to force FutureBuilder to rebuild
            final logsCount = gameLogsSnapshot.data?.length ?? 0;
            final maintenanceCount = maintenanceSnapshot.data?.length ?? 0;
            return FutureBuilder<Map<MaintenanceType, MaintenanceStatus>>(
              key: ValueKey('$logsCount-$maintenanceCount'),
              future: ballRepository.getAllMaintenanceStatuses(widget.ball.ballId),
              builder: (context, statusSnapshot) {
                if (statusSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (statusSnapshot.hasError) {
                  return Text('Error: ${statusSnapshot.error}');
                }

                final statuses = statusSnapshot.data ?? {};

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (statuses[MaintenanceType.deepClean] != null)
                      ProgressRingWithLabel(
                        status: statuses[MaintenanceType.deepClean]!,
                        size: AppConstants.progressRingLargeSize,
                      ),
                    if (statuses[MaintenanceType.oilExtract] != null)
                      ProgressRingWithLabel(
                        status: statuses[MaintenanceType.oilExtract]!,
                        size: AppConstants.progressRingLargeSize,
                      ),
                    if (statuses[MaintenanceType.resurface] != null)
                      ProgressRingWithLabel(
                        status: statuses[MaintenanceType.resurface]!,
                        size: AppConstants.progressRingLargeSize,
                      ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Future<void> _showDeleteDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Ball'),
        content: Text('Are you sure you want to delete "${widget.ball.name}"? This will also delete all game logs and maintenance records.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('DELETE'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final ballRepository = ref.read(ballRepositoryProvider);
      await ballRepository.deleteBall(widget.ball.ballId);
      if (mounted) {
        context.go('/');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ball deleted')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageService = ref.watch(imageServiceProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: Text(widget.ball.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => context.go('/'),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/ball/${widget.ball.ballId}/edit'),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _showDeleteDialog,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Specs'),
            Tab(text: 'Logs'),
            Tab(text: 'Maintenance'),
          ],
        ),
      ),
      body: BackgroundImage(
        opacity: 0.12,
        overlayOpacity: 0.4,
        child: Column(
        children: [
          // Header with image and progress rings
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Ball image
                    Container(
                      width: AppConstants.ballImageMediumSize,
                      height: AppConstants.ballImageMediumSize,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
                      ),
                      child: widget.ball.imageBase64 != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
                              child: Image.memory(
                                imageService.getDisplayImage(base64Data: widget.ball.imageBase64),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.sports_baseball,
                              size: 60,
                              color: Colors.grey[400],
                            ),
                    ),
                    const SizedBox(width: 16),
                    // Ball info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ball.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          if (widget.ball.brand != null)
                            Text(
                              widget.ball.brand!,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Progress rings - REACTIVE WITH STREAMBUILDER
                _buildProgressRings(),
              ],
            ),
          ),
          const Divider(height: 1),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSpecsTab(),
                _buildLogsTab(),
                _buildMaintenanceTab(),
              ],
            ),
          ),
        ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          // Show FAB only on Logs and Maintenance tabs
          if (_tabController.index == 1) {
            return FloatingActionButton(
              onPressed: () => context.go('/ball/${widget.ball.ballId}/add-log'),
              child: const Icon(Icons.add),
            );
          } else if (_tabController.index == 2) {
            return FloatingActionButton(
              onPressed: () => context.go('/ball/${widget.ball.ballId}/add-maintenance'),
              child: const Icon(Icons.add),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildSpecsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Factory Specifications
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Factory Specifications',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                if (widget.ball.coverstock != null)
                  _buildSpecRow('Coverstock', widget.ball.coverstock!),
                if (widget.ball.factoryFinish != null)
                  _buildSpecRow('Factory Finish', widget.ball.factoryFinish!),
                if (widget.ball.weightLb != null)
                  _buildSpecRow('Weight', '${widget.ball.weightLb} lbs'),
                if (widget.ball.rgFactory != null)
                  _buildSpecRow('RG (Factory)', widget.ball.rgFactory!.toStringAsFixed(3)),
                if (widget.ball.diffFactory != null)
                  _buildSpecRow('Differential (Factory)', widget.ball.diffFactory!.toStringAsFixed(3)),
                if (widget.ball.serial != null)
                  _buildSpecRow('Serial Number', widget.ball.serial!),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Post-Drill Specifications
        if (widget.ball.rgAfter != null || widget.ball.diffAfter != null)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Post-Drill Specifications',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.ball.rgAfter != null)
                    _buildSpecRow('RG (After Drilling)', widget.ball.rgAfter!.toStringAsFixed(3)),
                  if (widget.ball.diffAfter != null)
                    _buildSpecRow('Differential (After Drilling)', widget.ball.diffAfter!.toStringAsFixed(3)),
                ],
              ),
            ),
          ),
        if (widget.ball.rgAfter != null || widget.ball.diffAfter != null)
          const SizedBox(height: 16),
        // PAP Configuration
        if (widget.ball.papOver != null || widget.ball.papUp != null)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAP Configuration',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.ball.papOver != null)
                    _buildSpecRow('PAP Over', '${widget.ball.papOver} ${widget.ball.papUnit}'),
                  if (widget.ball.papUp != null)
                    _buildSpecRow('PAP Up', '${widget.ball.papUp} ${widget.ball.papUnit}'),
                  if (widget.ball.papHand != null)
                    _buildSpecRow('Hand', widget.ball.papHand!),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildLogsTab() {
    final gameLogRepository = ref.watch(gameLogRepositoryProvider);

    return StreamBuilder<List<GameLog>>(
      stream: gameLogRepository.watchLogsForBall(widget.ball.ballId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final logs = snapshot.data ?? [];

        if (logs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sports_score, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No game logs yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap + to add your first game log',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: logs.length,
          itemBuilder: (context, index) {
            final log = logs[index];
            final date = DateTime.fromMillisecondsSinceEpoch(log.date);
            final formattedDate = DateFormat.yMMMd().format(date);

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    log.games.toStringAsFixed(log.games.truncateToDouble() == log.games ? 0 : 1),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(log.center ?? 'Game Log'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(formattedDate),
                    if (log.notes != null && log.notes!.isNotEmpty)
                      Text(log.notes!, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                trailing: Chip(
                  label: Text('${log.games} games'),
                  backgroundColor: Colors.blue[50],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMaintenanceTab() {
    final maintenanceRepository = ref.watch(maintenanceRepositoryProvider);

    return StreamBuilder<List<MaintenanceRecord>>(
      stream: maintenanceRepository.watchMaintenanceForBall(widget.ball.ballId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final records = snapshot.data ?? [];

        if (records.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.build, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No maintenance records yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap + to add your first maintenance record',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: records.length,
          itemBuilder: (context, index) {
            final record = records[index];
            final date = DateTime.fromMillisecondsSinceEpoch(record.date);
            final formattedDate = DateFormat.yMMMd().format(date);
            final type = MaintenanceType.fromString(record.type);

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getMaintenanceColor(type),
                  child: Icon(_getMaintenanceIcon(type), color: Colors.white),
                ),
                title: Text(MaintenanceStatus(
                  type: type,
                  gamesSince: 0,
                  threshold: 1,
                ).displayName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(formattedDate),
                    if (record.notes != null && record.notes!.isNotEmpty)
                      Text(record.notes!, style: TextStyle(color: Colors.grey[600])),
                    if (record.gritSequence != null && record.gritSequence!.isNotEmpty)
                      Text('Grit: ${record.gritSequence}',
                           style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Color _getMaintenanceColor(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.deepClean:
        return Colors.green;
      case MaintenanceType.oilExtract:
        return Colors.orange;
      case MaintenanceType.resurface:
        return Colors.purple;
    }
  }

  IconData _getMaintenanceIcon(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.deepClean:
        return Icons.cleaning_services;
      case MaintenanceType.oilExtract:
        return Icons.water_drop;
      case MaintenanceType.resurface:
        return Icons.build;
    }
  }
}
