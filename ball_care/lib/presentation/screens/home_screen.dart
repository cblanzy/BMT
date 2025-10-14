import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/providers/providers.dart';
import '../widgets/version_footer.dart';
import '../widgets/background_image.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ballRepository = ref.watch(ballRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BallCare'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: BackgroundImage(
        opacity: 0.12,
        overlayOpacity: 0.4,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add-ball'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
