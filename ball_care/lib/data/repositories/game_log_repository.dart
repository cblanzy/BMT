import 'package:drift/drift.dart';
import '../database/database.dart';

class GameLogRepository {
  final AppDatabase _db;

  GameLogRepository(this._db);

  // Watch logs for a specific ball (reactive stream)
  Stream<List<GameLog>> watchLogsForBall(String ballId) {
    return (_db.select(_db.gameLogs)
          ..where((tbl) => tbl.ballId.equals(ballId))
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  // Get logs for a specific ball (one-time query)
  Future<List<GameLog>> getLogsForBall(String ballId) async {
    return await (_db.select(_db.gameLogs)
          ..where((tbl) => tbl.ballId.equals(ballId))
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)
          ]))
        .get();
  }

  // Insert new log
  Future<void> insertLog(GameLogsCompanion log) async {
    await _db.into(_db.gameLogs).insert(log);
  }

  // Delete log
  Future<void> deleteLog(String logId) async {
    await (_db.delete(_db.gameLogs)..where((tbl) => tbl.logId.equals(logId)))
        .go();
  }
}
