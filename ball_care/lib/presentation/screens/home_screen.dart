import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import '../../data/providers/providers.dart';
import '../../data/providers/theme_provider.dart';
import '../../data/models/maintenance_status.dart';
import '../../data/database/database.dart';
import '../widgets/version_footer.dart';
import '../widgets/background_image.dart';
import '../widgets/progress_ring.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showAddGameDialog(BuildContext context, WidgetRef ref) async {
    final ballRepository = ref.read(ballRepositoryProvider);
    final balls = await ballRepository.watchAllBalls().first;

    if (balls.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please add a ball first')),
        );
      }
      return;
    }

    String? selectedBallId = balls.first.ballId;

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Select Ball'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedBallId,
                decoration: const InputDecoration(
                  labelText: 'Select Ball',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.black),
                dropdownColor: Colors.white,
                items: balls.map((ball) {
                  return DropdownMenuItem(
                    value: ball.ballId,
                    child: Text(ball.name),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedBallId = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (selectedBallId != null) {
                  Navigator.of(dialogContext).pop();
                  context.go('/ball/$selectedBallId/add-log');
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ballRepository = ref.watch(ballRepositoryProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 32,
              width: 32,
            ),
            const SizedBox(width: 12),
            const Text('B.M.T.'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleTheme();
            },
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: BackgroundImage(
        child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
        stream: ballRepository.watchAllBalls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final balls = snapshot.data ?? [];

          if (balls.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_baseball,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No bowling balls yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap + to add your first ball',
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
            itemCount: balls.length,
            itemBuilder: (context, index) {
              final ball = balls[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => context.go('/ball/${ball.ballId}'),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Ball image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: _buildBallImage(ball),
                        ),
                        const SizedBox(width: 12),
                        // Ball name and brand
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ball.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (ball.brand != null)
                                Text(
                                  ball.brand!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // Maintenance indicators
                        _BallMaintenanceIndicators(ballId: ball.ballId),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
            ),
          ),
          const VersionFooter(),
        ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add_game',
            onPressed: () => _showAddGameDialog(context, ref),
            tooltip: 'Add Game',
            child: const Icon(Icons.sports),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'add_ball',
            onPressed: () => context.go('/add-ball'),
            tooltip: 'Add Ball',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildBallImage(ball) {
    // Try to display image from base64, URL, or local path
    if (ball.imageBase64 != null && ball.imageBase64!.isNotEmpty) {
      try {
        return Image.memory(
          base64Decode(ball.imageBase64!),
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(ball),
        );
      } catch (e) {
        return _buildPlaceholderImage(ball);
      }
    } else if (ball.imageUrl != null && ball.imageUrl!.isNotEmpty) {
      return Image.network(
        ball.imageUrl!,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(ball),
      );
    } else {
      return _buildPlaceholderImage(ball);
    }
  }

  Widget _buildPlaceholderImage(ball) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          ball.name[0].toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _BallMaintenanceIndicators extends ConsumerWidget {
  final String ballId;

  const _BallMaintenanceIndicators({required this.ballId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ballRepository = ref.watch(ballRepositoryProvider);
    final gameLogRepository = ref.watch(gameLogRepositoryProvider);
    final maintenanceRepository = ref.watch(maintenanceRepositoryProvider);

    return StreamBuilder<List<GameLog>>(
      stream: gameLogRepository.watchLogsForBall(ballId),
      builder: (context, gameLogsSnapshot) {
        return StreamBuilder<List<MaintenanceRecord>>(
          stream: maintenanceRepository.watchMaintenanceForBall(ballId),
          builder: (context, maintenanceSnapshot) {
            final logsCount = gameLogsSnapshot.data?.length ?? 0;
            final maintenanceCount = maintenanceSnapshot.data?.length ?? 0;

            return FutureBuilder<Map<MaintenanceType, MaintenanceStatus>>(
              key: ValueKey('$logsCount-$maintenanceCount'),
              future: ballRepository.getAllMaintenanceStatuses(ballId),
              builder: (context, statusSnapshot) {
                if (!statusSnapshot.hasData) {
                  return const SizedBox(width: 120);
                }

                final statuses = statusSnapshot.data!;
                final cleanStatus = statuses[MaintenanceType.deepClean];
                final oilStatus = statuses[MaintenanceType.oilExtract];
                final resurfaceStatus = statuses[MaintenanceType.resurface];

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (cleanStatus != null)
                      ProgressRing(
                        status: cleanStatus,
                        size: 40,
                      ),
                    const SizedBox(width: 4),
                    if (oilStatus != null)
                      ProgressRing(
                        status: oilStatus,
                        size: 40,
                      ),
                    const SizedBox(width: 4),
                    if (resurfaceStatus != null)
                      ProgressRing(
                        status: resurfaceStatus,
                        size: 40,
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
}
