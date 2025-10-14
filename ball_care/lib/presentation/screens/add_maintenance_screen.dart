import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../../data/database/database.dart';
import '../../data/providers/providers.dart';
import '../../data/models/maintenance_status.dart';
import '../widgets/background_image.dart';

class AddMaintenanceScreen extends ConsumerStatefulWidget {
  final String ballId;

  const AddMaintenanceScreen({super.key, required this.ballId});

  @override
  ConsumerState<AddMaintenanceScreen> createState() => _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends ConsumerState<AddMaintenanceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  final _gritSequenceController = TextEditingController();

  MaintenanceType _selectedType = MaintenanceType.deepClean;
  DateTime _selectedDate = DateTime.now();
  bool _isSaving = false;

  @override
  void dispose() {
    _notesController.dispose();
    _gritSequenceController.dispose();
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

  Future<void> _saveMaintenance() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final uuid = const Uuid();

      final maintenance = MaintenanceRecordsCompanion.insert(
        maintId: uuid.v4(),
        ballId: widget.ballId,
        type: _selectedType.value,
        date: _selectedDate.millisecondsSinceEpoch,
        notes: Value(_notesController.text.trim().isEmpty ? null : _notesController.text.trim()),
        gritSequence: Value(
          _selectedType == MaintenanceType.resurface && _gritSequenceController.text.trim().isNotEmpty
              ? _gritSequenceController.text.trim()
              : null,
        ),
        createdAt: now,
      );

      final maintenanceRepository = ref.read(maintenanceRepositoryProvider);
      await maintenanceRepository.insertMaintenance(maintenance);

      if (mounted) {
        context.go('/ball/${widget.ballId}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Maintenance record added successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding maintenance: $e')),
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
        title: const Text('Add Maintenance'),
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
              onPressed: _saveMaintenance,
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
            // Type
            DropdownButtonFormField<MaintenanceType>(
              value: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Maintenance Type *',
                border: OutlineInputBorder(),
              ),
              items: MaintenanceType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(MaintenanceStatus(
                    type: type,
                    gamesSince: 0,
                    threshold: 1,
                  ).displayName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            const SizedBox(height: 16),

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

            // Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Grit Sequence (only for resurface)
            if (_selectedType == MaintenanceType.resurface)
              TextFormField(
                controller: _gritSequenceController,
                decoration: const InputDecoration(
                  labelText: 'Grit Sequence',
                  hintText: '500, 1000, 2000, polish',
                  border: OutlineInputBorder(),
                ),
              ),
          ],
        ),
      ),
    ),
    );
  }
}
