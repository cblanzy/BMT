import 'package:drift/drift.dart';
import '../database/database.dart';
import '../models/maintenance_status.dart';

class BallRepository {
  final AppDatabase _db;

  BallRepository(this._db);

  // Watch all balls (reactive stream)
  Stream<List<Ball>> watchAllBalls() {
    return (_db.select(_db.balls)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  // Watch single ball (reactive stream)
  Stream<Ball?> watchBallById(String id) {
    return (_db.select(_db.balls)..where((tbl) => tbl.ballId.equals(id)))
        .watchSingleOrNull();
  }

  // Get single ball (one-time query)
  Future<Ball?> getBallById(String id) async {
    return await (_db.select(_db.balls)..where((tbl) => tbl.ballId.equals(id)))
        .getSingleOrNull();
  }

  // Insert new ball
  Future<void> insertBall(BallsCompanion ball) async {
    await _db.into(_db.balls).insert(ball);
  }

  // Update existing ball
  Future<void> updateBall(Ball ball) async {
    await _db.update(_db.balls).replace(ball);
  }

  // Delete ball (cascades to logs and maintenance)
  Future<void> deleteBall(String id) async {
    await (_db.delete(_db.balls)..where((tbl) => tbl.ballId.equals(id))).go();
  }

  // Get all maintenance statuses for a ball
  Future<Map<MaintenanceType, MaintenanceStatus>> getAllMaintenanceStatuses(
      String ballId) async {
    final ball = await getBallById(ballId);
    if (ball == null) {
      throw ArgumentError('Ball not found: $ballId');
    }

    final result = <MaintenanceType, MaintenanceStatus>{};

    for (final type in MaintenanceType.values) {
      final gamesSince = await _db.getGamesSince(
        ballId: ballId,
        maintenanceType: type.value,
      );

      // Get threshold (ball override or default)
      double threshold;
      switch (type) {
        case MaintenanceType.deepClean:
          if (ball.deepCleanGames != null) {
            threshold = ball.deepCleanGames!.toDouble();
          } else {
            threshold = (await _db.getMaintenanceThreshold(
              maintenanceType: 'deep_clean',
            ))
                .toDouble();
          }
          break;
        case MaintenanceType.oilExtract:
          if (ball.oilExtractGames != null) {
            threshold = ball.oilExtractGames!.toDouble();
          } else {
            threshold = (await _db.getMaintenanceThreshold(
              maintenanceType: 'oil_extract',
            ))
                .toDouble();
          }
          break;
        case MaintenanceType.resurface:
          if (ball.resurfaceGames != null) {
            threshold = ball.resurfaceGames!.toDouble();
          } else {
            threshold = (await _db.getMaintenanceThreshold(
              maintenanceType: 'resurface',
              coverstock: ball.coverstock,
            ))
                .toDouble();
          }
          break;
      }

      result[type] = MaintenanceStatus(
        type: type,
        gamesSince: gamesSince,
        threshold: threshold,
      );
    }

    return result;
  }
}
