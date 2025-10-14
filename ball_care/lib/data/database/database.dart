import 'package:drift/drift.dart';
import 'connection/connection.dart';

part 'database.g.dart';

// Table: balls
class Balls extends Table {
  TextColumn get ballId => text().named('ball_id')();
  TextColumn get name => text()();
  TextColumn get brand => text().nullable()();
  TextColumn get coverstock => text().nullable()();
  TextColumn get factoryFinish => text().named('factory_finish').nullable()();
  RealColumn get rgFactory => real().named('rg_factory').nullable()();
  RealColumn get diffFactory => real().named('diff_factory').nullable()();
  RealColumn get rgAfter => real().named('rg_after').nullable()();
  RealColumn get diffAfter => real().named('diff_after').nullable()();
  RealColumn get papOver => real().named('pap_over').nullable()();
  RealColumn get papUp => real().named('pap_up').nullable()();
  TextColumn get papUnit => text().named('pap_unit').withDefault(const Constant('in'))();
  TextColumn get papHand => text().named('pap_hand').nullable()();
  TextColumn get specSource => text().named('spec_source').nullable()();
  RealColumn get specConfidence => real().named('spec_confidence').nullable()();
  RealColumn get weightLb => real().named('weight_lb').nullable()();
  TextColumn get serial => text().nullable()();
  TextColumn get imageLocalPath => text().named('image_local_path').nullable()();
  TextColumn get imageUrl => text().named('image_url').nullable()();
  TextColumn get imageBase64 => text().named('image_base64').nullable()();
  IntColumn get deepCleanGames => integer().named('deep_clean_games').nullable()();
  IntColumn get oilExtractGames => integer().named('oil_extract_games').nullable()();
  IntColumn get resurfaceGames => integer().named('resurface_games').nullable()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();

  @override
  Set<Column> get primaryKey => {ballId};
}

// Table: game_logs
class GameLogs extends Table {
  TextColumn get logId => text().named('log_id')();
  TextColumn get ballId => text().named('ball_id').references(Balls, #ballId, onDelete: KeyAction.cascade)();
  IntColumn get date => integer()();
  TextColumn get center => text().nullable()();
  RealColumn get games => real()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer().named('created_at')();

  @override
  Set<Column> get primaryKey => {logId};
}

// Table: maintenance_records
class MaintenanceRecords extends Table {
  TextColumn get maintId => text().named('maint_id')();
  TextColumn get ballId => text().named('ball_id').references(Balls, #ballId, onDelete: KeyAction.cascade)();
  TextColumn get type => text()();
  IntColumn get date => integer()();
  TextColumn get notes => text().nullable()();
  TextColumn get gritSequence => text().named('grit_sequence').nullable()();
  IntColumn get createdAt => integer().named('created_at')();

  @override
  Set<Column> get primaryKey => {maintId};
}

// Table: kv_store
class KvStore extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [Balls, GameLogs, MaintenanceRecords, KvStore])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connectionFactory());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _initializeDefaults();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle schema migrations if needed in the future
      },
    );
  }

  Future<void> _initializeDefaults() async {
    // Insert default settings into kv_store
    final defaults = {
      'defaults.deep_clean_games': '18',
      'defaults.oil_extract_games': '70',
      'defaults.resurface_games.urethane': '90',
      'defaults.resurface_games.reactive_solid': '70',
      'defaults.resurface_games.reactive_pearl': '80',
      'defaults.resurface_games.reactive_hybrid': '80',
      'schema_version': '3',
    };

    for (final entry in defaults.entries) {
      await into(kvStore).insert(
        KvStoreCompanion.insert(
          key: entry.key,
          value: entry.value,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }

  // Get setting from kv_store
  Future<String?> getSetting(String key) async {
    final query = select(kvStore)..where((tbl) => tbl.key.equals(key));
    final result = await query.getSingleOrNull();
    return result?.value;
  }

  // Set setting in kv_store
  Future<void> setSetting(String key, String value) async {
    await into(kvStore).insert(
      KvStoreCompanion.insert(key: key, value: value),
      mode: InsertMode.insertOrReplace,
    );
  }

  // Calculate games since last maintenance
  Future<double> getGamesSince({
    required String ballId,
    required String maintenanceType,
  }) async {
    // 1. Find last maintenance of this type
    final maintenanceQuery = select(maintenanceRecords)
      ..where((tbl) => tbl.ballId.equals(ballId) & tbl.type.equals(maintenanceType))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)])
      ..limit(1);

    final lastMaintenance = await maintenanceQuery.getSingleOrNull();

    // 2. Determine cutoff date
    int cutoffDate;
    if (lastMaintenance != null) {
      cutoffDate = lastMaintenance.date;
    } else {
      // Use ball creation date if no maintenance found
      final ballQuery = select(balls)..where((tbl) => tbl.ballId.equals(ballId));
      final ball = await ballQuery.getSingle();
      cutoffDate = ball.createdAt;
    }

    // 3. Sum all games where date >= cutoff (IMPORTANT: use >= not >)
    final logsQuery = select(gameLogs)
      ..where((tbl) => tbl.ballId.equals(ballId) & tbl.date.isBiggerOrEqualValue(cutoffDate));

    final logs = await logsQuery.get();
    final totalGames = logs.fold<double>(0.0, (sum, log) => sum + log.games);

    return totalGames;
  }

  // Get default threshold for maintenance type
  Future<int> getMaintenanceThreshold({
    required String maintenanceType,
    String? coverstock,
  }) async {
    String key;

    switch (maintenanceType) {
      case 'deep_clean':
        key = 'defaults.deep_clean_games';
        break;
      case 'oil_extract':
        key = 'defaults.oil_extract_games';
        break;
      case 'resurface':
        if (coverstock == null) {
          // Default to reactive_solid if no coverstock specified
          key = 'defaults.resurface_games.reactive_solid';
        } else {
          // Map coverstock to key format
          final coverstockKey = coverstock.toLowerCase().replaceAll(' ', '_');
          key = 'defaults.resurface_games.$coverstockKey';
        }
        break;
      default:
        throw ArgumentError('Invalid maintenance type: $maintenanceType');
    }

    final value = await getSetting(key);
    return int.parse(value ?? '70'); // Default fallback
  }
}
