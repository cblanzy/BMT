import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';
import '../repositories/ball_repository.dart';
import '../repositories/game_log_repository.dart';
import '../repositories/maintenance_repository.dart';
import '../services/image_service.dart';
import '../services/data_management_service.dart';

// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Repository providers
final ballRepositoryProvider = Provider<BallRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BallRepository(db);
});

final gameLogRepositoryProvider = Provider<GameLogRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return GameLogRepository(db);
});

final maintenanceRepositoryProvider = Provider<MaintenanceRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return MaintenanceRepository(db);
});

// Service providers
final imageServiceProvider = Provider<ImageService>((ref) {
  return ImageService();
});

final dataManagementServiceProvider = Provider<DataManagementService>((ref) {
  final db = ref.watch(databaseProvider);
  return DataManagementService(db);
});
