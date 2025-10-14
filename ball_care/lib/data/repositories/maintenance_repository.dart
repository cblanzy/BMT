import 'package:drift/drift.dart';
import '../database/database.dart';

class MaintenanceRepository {
  final AppDatabase _db;

  MaintenanceRepository(this._db);

  // Watch maintenance records for a specific ball (reactive stream)
  Stream<List<MaintenanceRecord>> watchMaintenanceForBall(String ballId) {
    return (_db.select(_db.maintenanceRecords)
          ..where((tbl) => tbl.ballId.equals(ballId))
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  // Get maintenance records for a specific ball (one-time query)
  Future<List<MaintenanceRecord>> getMaintenanceForBall(String ballId) async {
    return await (_db.select(_db.maintenanceRecords)
          ..where((tbl) => tbl.ballId.equals(ballId))
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)
          ]))
        .get();
  }

  // Insert new maintenance record
  Future<void> insertMaintenance(MaintenanceRecordsCompanion record) async {
    await _db.into(_db.maintenanceRecords).insert(record);
  }

  // Delete maintenance record
  Future<void> deleteMaintenance(String maintId) async {
    await (_db.delete(_db.maintenanceRecords)
          ..where((tbl) => tbl.maintId.equals(maintId)))
        .go();
  }
}
