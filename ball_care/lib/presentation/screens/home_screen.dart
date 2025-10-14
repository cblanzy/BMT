import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/providers/providers.dart';
import '../../data/providers/theme_provider.dart';
import '../widgets/version_footer.dart';
import '../widgets/background_image.dart';

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
        title: const Text('BallCare'),
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
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      ball.name[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(ball.name),
                  subtitle: ball.brand != null ? Text(ball.brand!) : null,
                  onTap: () => context.go('/ball/${ball.ballId}'),
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
}
