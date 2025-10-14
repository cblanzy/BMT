import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';
import '../providers/providers.dart';

final settingsServiceProvider = Provider<SettingsService>((ref) {
  final db = ref.watch(databaseProvider);
  return SettingsService(db);
});

class SettingsService {
  final AppDatabase _db;

  SettingsService(this._db);

  static const String _themeKey = 'theme_mode_dark';

  Future<bool> getThemeMode() async {
    final value = await _db.getSetting(_themeKey);
    return value == 'true';
  }

  Future<void> setThemeMode(bool isDark) async {
    await _db.setSetting(_themeKey, isDark.toString());
  }
}
