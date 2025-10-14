import 'dart:convert';
import 'package:drift/drift.dart';
import '../database/database.dart';

/// Service for managing data import, export, and purging
class DataManagementService {
  final AppDatabase _db;

  DataManagementService(this._db);

  /// Export all data as JSON
  Future<Map<String, dynamic>> exportData() async {
    final balls = await _db.select(_db.balls).get();
    final gameLogs = await _db.select(_db.gameLogs).get();
    final maintenanceRecords = await _db.select(_db.maintenanceRecords).get();
    final kvStore = await _db.select(_db.kvStore).get();

    return {
      'version': '1.0',
      'exportDate': DateTime.now().toIso8601String(),
      'balls': balls.map((b) => _ballToJson(b)).toList(),
      'gameLogs': gameLogs.map((g) => _gameLogToJson(g)).toList(),
      'maintenanceRecords':
          maintenanceRecords.map((m) => _maintenanceToJson(m)).toList(),
      'settings': kvStore.map((kv) => {'key': kv.key, 'value': kv.value}).toList(),
    };
  }

  /// Export data as JSON string
  Future<String> exportDataAsString() async {
    final data = await exportData();
    return jsonEncode(data);
  }

  /// Import data from JSON
  Future<ImportResult> importData(Map<String, dynamic> jsonData) async {
    try {
      // Validate data structure
      if (!jsonData.containsKey('balls') ||
          !jsonData.containsKey('gameLogs') ||
          !jsonData.containsKey('maintenanceRecords')) {
        return ImportResult(
          success: false,
          message: 'Invalid data format',
        );
      }

      int ballsImported = 0;
      int gameLogsImported = 0;
      int maintenanceImported = 0;
      int settingsImported = 0;

      // Import in transaction
      await _db.transaction(() async {
        // Import balls
        final ballsData = jsonData['balls'] as List;
        for (final ballJson in ballsData) {
          try {
            final ball = _ballFromJson(ballJson);
            await _db.into(_db.balls).insert(
                  ball,
                  mode: InsertMode.insertOrReplace,
                );
            ballsImported++;
          } catch (e) {
            // Skip invalid entries
            continue;
          }
        }

        // Import game logs
        final gameLogsData = jsonData['gameLogs'] as List;
        for (final gameLogJson in gameLogsData) {
          try {
            final gameLog = _gameLogFromJson(gameLogJson);
            await _db.into(_db.gameLogs).insert(
                  gameLog,
                  mode: InsertMode.insertOrReplace,
                );
            gameLogsImported++;
          } catch (e) {
            continue;
          }
        }

        // Import maintenance records
        final maintenanceData = jsonData['maintenanceRecords'] as List;
        for (final maintenanceJson in maintenanceData) {
          try {
            final maintenance = _maintenanceFromJson(maintenanceJson);
            await _db.into(_db.maintenanceRecords).insert(
                  maintenance,
                  mode: InsertMode.insertOrReplace,
                );
            maintenanceImported++;
          } catch (e) {
            continue;
          }
        }

        // Import settings
        if (jsonData.containsKey('settings')) {
          final settingsData = jsonData['settings'] as List;
          for (final settingJson in settingsData) {
            try {
              final key = settingJson['key'] as String;
              final value = settingJson['value'] as String;
              await _db.into(_db.kvStore).insert(
                    KvStoreCompanion.insert(key: key, value: value),
                    mode: InsertMode.insertOrReplace,
                  );
              settingsImported++;
            } catch (e) {
              continue;
            }
          }
        }
      });

      return ImportResult(
        success: true,
        message:
            'Imported: $ballsImported balls, $gameLogsImported games, $maintenanceImported maintenance records, $settingsImported settings',
        ballsImported: ballsImported,
        gameLogsImported: gameLogsImported,
        maintenanceImported: maintenanceImported,
        settingsImported: settingsImported,
      );
    } catch (e) {
      return ImportResult(
        success: false,
        message: 'Import failed: ${e.toString()}',
      );
    }
  }

  /// Import data from JSON string
  Future<ImportResult> importDataFromString(String jsonString) async {
    try {
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      return await importData(jsonData);
    } catch (e) {
      return ImportResult(
        success: false,
        message: 'Failed to parse JSON: ${e.toString()}',
      );
    }
  }

  /// Purge all data from the database
  Future<PurgeResult> purgeAllData() async {
    try {
      int ballsDeleted = 0;
      int gameLogsDeleted = 0;
      int maintenanceDeleted = 0;
      int settingsDeleted = 0;

      await _db.transaction(() async {
        ballsDeleted = await _db.delete(_db.balls).go();
        gameLogsDeleted = await _db.delete(_db.gameLogs).go();
        maintenanceDeleted = await _db.delete(_db.maintenanceRecords).go();
        settingsDeleted = await _db.delete(_db.kvStore).go();
      });

      return PurgeResult(
        success: true,
        message:
            'Deleted: $ballsDeleted balls, $gameLogsDeleted games, $maintenanceDeleted maintenance records, $settingsDeleted settings',
        ballsDeleted: ballsDeleted,
        gameLogsDeleted: gameLogsDeleted,
        maintenanceDeleted: maintenanceDeleted,
        settingsDeleted: settingsDeleted,
      );
    } catch (e) {
      return PurgeResult(
        success: false,
        message: 'Purge failed: ${e.toString()}',
      );
    }
  }

  // Helper methods for JSON conversion
  Map<String, dynamic> _ballToJson(Ball ball) {
    return {
      'ballId': ball.ballId,
      'name': ball.name,
      'brand': ball.brand,
      'coverstock': ball.coverstock,
      'factoryFinish': ball.factoryFinish,
      'rgFactory': ball.rgFactory,
      'diffFactory': ball.diffFactory,
      'rgAfter': ball.rgAfter,
      'diffAfter': ball.diffAfter,
      'papOver': ball.papOver,
      'papUp': ball.papUp,
      'papUnit': ball.papUnit,
      'papHand': ball.papHand,
      'specSource': ball.specSource,
      'specConfidence': ball.specConfidence,
      'weightLb': ball.weightLb,
      'serial': ball.serial,
      'imageLocalPath': ball.imageLocalPath,
      'imageUrl': ball.imageUrl,
      'imageBase64': ball.imageBase64,
      'deepCleanGames': ball.deepCleanGames,
      'oilExtractGames': ball.oilExtractGames,
      'resurfaceGames': ball.resurfaceGames,
      'createdAt': ball.createdAt,
      'updatedAt': ball.updatedAt,
    };
  }

  BallsCompanion _ballFromJson(Map<String, dynamic> json) {
    return BallsCompanion.insert(
      ballId: json['ballId'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
      papUnit: Value(json['papUnit'] as String? ?? 'in'),
      brand: Value(json['brand'] as String?),
      coverstock: Value(json['coverstock'] as String?),
      factoryFinish: Value(json['factoryFinish'] as String?),
      rgFactory: Value(json['rgFactory'] as double?),
      diffFactory: Value(json['diffFactory'] as double?),
      rgAfter: Value(json['rgAfter'] as double?),
      diffAfter: Value(json['diffAfter'] as double?),
      papOver: Value(json['papOver'] as double?),
      papUp: Value(json['papUp'] as double?),
      papHand: Value(json['papHand'] as String?),
      specSource: Value(json['specSource'] as String?),
      specConfidence: Value(json['specConfidence'] as double?),
      weightLb: Value(json['weightLb'] as double?),
      serial: Value(json['serial'] as String?),
      imageLocalPath: Value(json['imageLocalPath'] as String?),
      imageUrl: Value(json['imageUrl'] as String?),
      imageBase64: Value(json['imageBase64'] as String?),
      deepCleanGames: Value(json['deepCleanGames'] as int?),
      oilExtractGames: Value(json['oilExtractGames'] as int?),
      resurfaceGames: Value(json['resurfaceGames'] as int?),
    );
  }

  Map<String, dynamic> _gameLogToJson(GameLog gameLog) {
    return {
      'logId': gameLog.logId,
      'ballId': gameLog.ballId,
      'date': gameLog.date,
      'center': gameLog.center,
      'games': gameLog.games,
      'notes': gameLog.notes,
      'createdAt': gameLog.createdAt,
    };
  }

  GameLogsCompanion _gameLogFromJson(Map<String, dynamic> json) {
    return GameLogsCompanion.insert(
      logId: json['logId'] as String,
      ballId: json['ballId'] as String,
      date: json['date'] as int,
      games: json['games'] as double,
      createdAt: json['createdAt'] as int,
      center: Value(json['center'] as String?),
      notes: Value(json['notes'] as String?),
    );
  }

  Map<String, dynamic> _maintenanceToJson(MaintenanceRecord record) {
    return {
      'maintId': record.maintId,
      'ballId': record.ballId,
      'type': record.type,
      'date': record.date,
      'notes': record.notes,
      'gritSequence': record.gritSequence,
      'createdAt': record.createdAt,
    };
  }

  MaintenanceRecordsCompanion _maintenanceFromJson(Map<String, dynamic> json) {
    return MaintenanceRecordsCompanion.insert(
      maintId: json['maintId'] as String,
      ballId: json['ballId'] as String,
      type: json['type'] as String,
      date: json['date'] as int,
      createdAt: json['createdAt'] as int,
      notes: Value(json['notes'] as String?),
      gritSequence: Value(json['gritSequence'] as String?),
    );
  }
}

/// Result of an import operation
class ImportResult {
  final bool success;
  final String message;
  final int ballsImported;
  final int gameLogsImported;
  final int maintenanceImported;
  final int settingsImported;

  ImportResult({
    required this.success,
    required this.message,
    this.ballsImported = 0,
    this.gameLogsImported = 0,
    this.maintenanceImported = 0,
    this.settingsImported = 0,
  });
}

/// Result of a purge operation
class PurgeResult {
  final bool success;
  final String message;
  final int ballsDeleted;
  final int gameLogsDeleted;
  final int maintenanceDeleted;
  final int settingsDeleted;

  PurgeResult({
    required this.success,
    required this.message,
    this.ballsDeleted = 0,
    this.gameLogsDeleted = 0,
    this.maintenanceDeleted = 0,
    this.settingsDeleted = 0,
  });
}
