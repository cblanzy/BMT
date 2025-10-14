import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../data/providers/providers.dart';
import '../widgets/background_image.dart';
import '../widgets/styled_form_field.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
// Conditional imports for web vs mobile
import 'settings_screen_stub.dart'
    if (dart.library.html) 'settings_screen_web.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for maintenance intervals
  final _deepCleanController = TextEditingController();
  final _oilExtractController = TextEditingController();
  final _resurfaceUrethaneController = TextEditingController();
  final _resurfaceReactiveSolidController = TextEditingController();
  final _resurfaceReactivePearlController = TextEditingController();
  final _resurfaceReactiveHybridController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _deepCleanController.dispose();
    _oilExtractController.dispose();
    _resurfaceUrethaneController.dispose();
    _resurfaceReactiveSolidController.dispose();
    _resurfaceReactivePearlController.dispose();
    _resurfaceReactiveHybridController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final db = ref.read(databaseProvider);

      final deepClean = await db.getSetting('defaults.deep_clean_games');
      final oilExtract = await db.getSetting('defaults.oil_extract_games');
      final urethane = await db.getSetting('defaults.resurface_games.urethane');
      final reactiveSolid = await db.getSetting('defaults.resurface_games.reactive_solid');
      final reactivePearl = await db.getSetting('defaults.resurface_games.reactive_pearl');
      final reactiveHybrid = await db.getSetting('defaults.resurface_games.reactive_hybrid');

      _deepCleanController.text = deepClean ?? '18';
      _oilExtractController.text = oilExtract ?? '70';
      _resurfaceUrethaneController.text = urethane ?? '90';
      _resurfaceReactiveSolidController.text = reactiveSolid ?? '70';
      _resurfaceReactivePearlController.text = reactivePearl ?? '80';
      _resurfaceReactiveHybridController.text = reactiveHybrid ?? '80';
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading settings: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _saveSettings() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final db = ref.read(databaseProvider);

      await db.setSetting('defaults.deep_clean_games', _deepCleanController.text.trim());
      await db.setSetting('defaults.oil_extract_games', _oilExtractController.text.trim());
      await db.setSetting('defaults.resurface_games.urethane', _resurfaceUrethaneController.text.trim());
      await db.setSetting('defaults.resurface_games.reactive_solid', _resurfaceReactiveSolidController.text.trim());
      await db.setSetting('defaults.resurface_games.reactive_pearl', _resurfaceReactivePearlController.text.trim());
      await db.setSetting('defaults.resurface_games.reactive_hybrid', _resurfaceReactiveHybridController.text.trim());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Settings saved successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving settings: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  String? _validateNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    final number = int.tryParse(value.trim());
    if (number == null || number < 1) {
      return 'Please enter a valid number (minimum 1)';
    }
    return null;
  }

  Future<void> _exportData() async {
    final dataService = ref.read(dataManagementServiceProvider);
    try {
      final jsonString = await dataService.exportDataAsString();

      if (kIsWeb) {
        // Web-specific export using dart:html
        exportDataWeb(jsonString);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data exported successfully')),
          );
        }
      } else {
        // Mobile/Desktop export - show message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Export feature is only available on web version'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    }
  }

  Future<void> _importData() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        withData: true,
      );

      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      if (file.bytes == null) {
        throw Exception('No file data');
      }

      final jsonString = utf8.decode(file.bytes!);
      final dataService = ref.read(dataManagementServiceProvider);
      final importResult = await dataService.importDataFromString(jsonString);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(importResult.message),
            backgroundColor: importResult.success ? Colors.green : Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Import failed: $e')),
        );
      }
    }
  }

  Future<void> _showPurgeDialog() async {
    final controller = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Purge All Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'WARNING: This will permanently delete ALL data including:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('• All bowling balls'),
            const Text('• All game logs'),
            const Text('• All maintenance records'),
            const Text('• All settings'),
            const SizedBox(height: 16),
            const Text(
              'This action CANNOT be undone!',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Type "delete" to confirm:'),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type delete here',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(controller.text.toLowerCase() == 'delete');
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('PURGE DATA'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final dataService = ref.read(dataManagementServiceProvider);
      final result = await dataService.purgeAllData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message),
            backgroundColor: result.success ? Colors.orange : Colors.red,
          ),
        );

        if (result.success) {
          // Reload settings after purge
          _loadSettings();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Settings'),
        actions: [
          if (_isSaving)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else ...[
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: _saveSettings,
              child: const Text('SAVE'),
            ),
          ],
        ],
      ),
      body: BackgroundImage(
        child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Default Maintenance Intervals',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'These values will be used for new balls unless overridden',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 24),

            // Deep Clean
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deep Clean Interval',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'How many games between deep cleans',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 16),
                    StyledFormField(
                      controller: _deepCleanController,
                      labelText: 'Games',
                      keyboardType: TextInputType.number,
                      validator: _validateNumber,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Oil Extract
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oil Extract Interval',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'How many games between oil extractions',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 16),
                    StyledFormField(
                      controller: _oilExtractController,
                      labelText: 'Games',
                      keyboardType: TextInputType.number,
                      validator: _validateNumber,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Resurface Intervals
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resurface Intervals',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Games between resurfacing (by coverstock type)',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 16),

                    // Urethane
                    StyledFormField(
                      controller: _resurfaceUrethaneController,
                      labelText: 'Urethane',
                      keyboardType: TextInputType.number,
                      validator: _validateNumber,
                    ),
                    const SizedBox(height: 16),

                    // Reactive Solid
                    StyledFormField(
                      controller: _resurfaceReactiveSolidController,
                      labelText: 'Reactive Solid',
                      keyboardType: TextInputType.number,
                      validator: _validateNumber,
                    ),
                    const SizedBox(height: 16),

                    // Reactive Pearl
                    StyledFormField(
                      controller: _resurfaceReactivePearlController,
                      labelText: 'Reactive Pearl',
                      keyboardType: TextInputType.number,
                      validator: _validateNumber,
                    ),
                    const SizedBox(height: 16),

                    // Reactive Hybrid
                    StyledFormField(
                      controller: _resurfaceReactiveHybridController,
                      labelText: 'Reactive Hybrid',
                      keyboardType: TextInputType.number,
                      validator: _validateNumber,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            Text(
              'Note: Changing these settings will only affect new balls. Existing balls will keep their current intervals.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Data Management',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[600]!, Colors.blue[400]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _exportData,
                icon: const Icon(Icons.download),
                label: const Text('Export Data'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[600]!, Colors.green[400]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _importData,
                icon: const Icon(Icons.upload),
                label: const Text('Import Data'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[700]!, Colors.red[500]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _showPurgeDialog,
                icon: const Icon(Icons.delete_forever),
                label: const Text('Purge All Data'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        ),
      ),
    );
  }
}
