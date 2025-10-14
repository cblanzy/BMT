import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../../data/database/database.dart';
import '../../data/providers/providers.dart';
import '../widgets/background_image.dart';

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
  bool _isSaving = false;

  @override
  void dispose() {
    _centerController.dispose();
    _gamesController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
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

      final log = GameLogsCompanion.insert(
        logId: uuid.v4(),
        ballId: widget.ballId,
        date: _selectedDate.millisecondsSinceEpoch,
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
          else
            TextButton(
              onPressed: _saveLog,
              child: const Text('SAVE'),
            ),
        ],
      ),
      body: BackgroundImage(
        opacity: 0.12,
        overlayOpacity: 0.4,
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
            TextFormField(
              controller: _centerController,
              decoration: const InputDecoration(
                labelText: 'Bowling Center',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Number of Games
            TextFormField(
              controller: _gamesController,
              decoration: const InputDecoration(
                labelText: 'Number of Games *',
                border: OutlineInputBorder(),
                helperText: 'Use decimals for partial games (e.g., 2.5)',
              ),
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
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
