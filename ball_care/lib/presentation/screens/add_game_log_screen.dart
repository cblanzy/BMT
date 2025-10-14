import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../../data/database/database.dart';
import '../../data/providers/providers.dart';
import '../widgets/background_image.dart';
import '../widgets/styled_form_field.dart';

class AddGameLogScreen extends ConsumerStatefulWidget {
  final String ballId;

  const AddGameLogScreen({super.key, required this.ballId});

  @override
  ConsumerState<AddGameLogScreen> createState() => _AddGameLogScreenState();
}

class _AddGameLogScreenState extends ConsumerState<AddGameLogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _centerController = TextEditingController();
  final _gamesController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime? _earliestAllowedDate;
  bool _isSaving = false;
  bool _isLoadingDateConstraints = true;

  @override
  void initState() {
    super.initState();
    _loadDateConstraints();
  }

  Future<void> _loadDateConstraints() async {
    try {
      final maintenanceRepository = ref.read(maintenanceRepositoryProvider);
      final records = await maintenanceRepository.getMaintenanceForBall(widget.ballId);

      if (records.isNotEmpty) {
        // Find the most recent maintenance date across all types
        final mostRecentMaintenance = records.reduce((a, b) =>
          a.date > b.date ? a : b
        );
        _earliestAllowedDate = DateTime.fromMillisecondsSinceEpoch(mostRecentMaintenance.date);
      } else {
        // No maintenance history - allow games up to 30 days in the past
        _earliestAllowedDate = DateTime.now().subtract(const Duration(days: 30));
      }

      if (mounted) {
        setState(() {
          _isLoadingDateConstraints = false;
        });
      }
    } catch (e) {
      // If there's an error, default to 30 days in the past
      if (mounted) {
        setState(() {
          _earliestAllowedDate = DateTime.now().subtract(const Duration(days: 30));
          _isLoadingDateConstraints = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _centerController.dispose();
    _gamesController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    if (_isLoadingDateConstraints) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Loading date constraints...')),
      );
      return;
    }

    final firstDate = _earliestAllowedDate ?? DateTime.now().subtract(const Duration(days: 30));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: firstDate,
      lastDate: DateTime.now(),
      helpText: 'Select game date',
      errorFormatText: 'Invalid date format',
      fieldLabelText: 'Game date',
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _saveLog() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final uuid = const Uuid();

      // Normalize the date to midnight (start of day) to ensure proper comparison
      final normalizedDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);

      final log = GameLogsCompanion.insert(
        logId: uuid.v4(),
        ballId: widget.ballId,
        date: normalizedDate.millisecondsSinceEpoch,
        center: Value(_centerController.text.trim().isEmpty ? null : _centerController.text.trim()),
        games: double.parse(_gamesController.text.trim()),
        notes: Value(_notesController.text.trim().isEmpty ? null : _notesController.text.trim()),
        createdAt: now,
      );

      final gameLogRepository = ref.read(gameLogRepositoryProvider);
      await gameLogRepository.insertLog(log);

      if (mounted) {
        context.go('/ball/${widget.ballId}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Game log added successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding log: $e')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Game Log'),
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
              onPressed: () => context.go('/ball/${widget.ballId}'),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: _saveLog,
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
            // Date
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Date *'),
              subtitle: Text(
                '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 16),

            // Bowling Center
            StyledFormField(
              controller: _centerController,
              labelText: 'Bowling Center',
            ),
            const SizedBox(height: 16),

            // Number of Games
            StyledFormField(
              controller: _gamesController,
              labelText: 'Number of Games *',
              helperText: 'Use decimals for partial games (e.g., 2.5)',
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Number of games is required';
                }
                final games = double.tryParse(value.trim());
                if (games == null || games < 0.5) {
                  return 'Please enter at least 0.5 games';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Notes
            StyledFormField(
              controller: _notesController,
              labelText: 'Notes',
              maxLines: 3,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
