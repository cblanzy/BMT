import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;
import '../../core/constants/app_constants.dart';
import '../../data/database/database.dart';
import '../../data/providers/providers.dart';
import '../widgets/background_image.dart';

class AddBallScreen extends ConsumerStatefulWidget {
  const AddBallScreen({super.key});

  @override
  ConsumerState<AddBallScreen> createState() => _AddBallScreenState();
}

class _AddBallScreenState extends ConsumerState<AddBallScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _factoryFinishController = TextEditingController();
  final _serialController = TextEditingController();
  final _rgFactoryController = TextEditingController();
  final _diffFactoryController = TextEditingController();
  final _rgAfterController = TextEditingController();
  final _diffAfterController = TextEditingController();
  final _papOverController = TextEditingController();
  final _papUpController = TextEditingController();

  String? _selectedCoverstock;
  double? _selectedWeight;
  String _selectedPapUnit = 'in';
  String? _selectedPapHand;
  String? _imageData;
  bool _showAdvancedSpecs = false;
  bool _showPapConfig = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _factoryFinishController.dispose();
    _serialController.dispose();
    _rgFactoryController.dispose();
    _diffFactoryController.dispose();
    _rgAfterController.dispose();
    _diffAfterController.dispose();
    _papOverController.dispose();
    _papUpController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final imageService = ref.read(imageServiceProvider);
    final pickedFile = await imageService.pickImage();
    if (pickedFile != null) {
      final processedImage = await imageService.processImage(pickedFile);
      setState(() {
        _imageData = processedImage;
      });
    }
  }

  Future<void> _saveBall() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final uuid = const Uuid();

      final ball = BallsCompanion.insert(
        ballId: uuid.v4(),
        name: _nameController.text.trim(),
        brand: Value(_brandController.text.trim().isEmpty ? null : _brandController.text.trim()),
        coverstock: Value(_selectedCoverstock),
        factoryFinish: Value(_factoryFinishController.text.trim().isEmpty ? null : _factoryFinishController.text.trim()),
        rgFactory: Value(_rgFactoryController.text.trim().isEmpty ? null : double.tryParse(_rgFactoryController.text.trim())),
        diffFactory: Value(_diffFactoryController.text.trim().isEmpty ? null : double.tryParse(_diffFactoryController.text.trim())),
        rgAfter: Value(_rgAfterController.text.trim().isEmpty ? null : double.tryParse(_rgAfterController.text.trim())),
        diffAfter: Value(_diffAfterController.text.trim().isEmpty ? null : double.tryParse(_diffAfterController.text.trim())),
        papOver: Value(_papOverController.text.trim().isEmpty ? null : double.tryParse(_papOverController.text.trim())),
        papUp: Value(_papUpController.text.trim().isEmpty ? null : double.tryParse(_papUpController.text.trim())),
        papUnit: Value(_selectedPapUnit),
        papHand: Value(_selectedPapHand),
        weightLb: Value(_selectedWeight),
        serial: Value(_serialController.text.trim().isEmpty ? null : _serialController.text.trim()),
        imageBase64: Value(_imageData),
        createdAt: now,
        updatedAt: now,
      );

      final ballRepository = ref.read(ballRepositoryProvider);
      await ballRepository.insertBall(ball);

      if (mounted) {
        context.go('/');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ball added successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding ball: $e')),
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
    final imageService = ref.watch(imageServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Ball'),
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
              onPressed: _saveBall,
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
            // Image upload
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: AppConstants.ballImageMediumSize,
                  height: AppConstants.ballImageMediumSize,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: _imageData != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
                          child: Image.memory(
                            imageService.getDisplayImage(base64Data: _imageData),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, size: 40, color: Colors.grey[600]),
                            const SizedBox(height: 8),
                            Text('Add Photo', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Name (required)
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Ball Name *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Brand
            TextFormField(
              controller: _brandController,
              decoration: const InputDecoration(
                labelText: 'Brand',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Weight
            DropdownButtonFormField<double>(
              value: _selectedWeight,
              decoration: const InputDecoration(
                labelText: 'Weight (lbs)',
                border: OutlineInputBorder(),
              ),
              items: AppConstants.weightOptions.map((weight) {
                return DropdownMenuItem(
                  value: weight,
                  child: Text('$weight lbs'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedWeight = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Coverstock
            DropdownButtonFormField<String>(
              value: _selectedCoverstock,
              decoration: const InputDecoration(
                labelText: 'Coverstock',
                border: OutlineInputBorder(),
              ),
              items: AppConstants.coverstockTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCoverstock = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Factory Finish
            TextFormField(
              controller: _factoryFinishController,
              decoration: const InputDecoration(
                labelText: 'Factory Finish',
                hintText: 'e.g., 1500 polished',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Serial Number
            TextFormField(
              controller: _serialController,
              decoration: const InputDecoration(
                labelText: 'Serial Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Advanced Specs (collapsible)
            ExpansionTile(
              title: const Text('Advanced Specifications'),
              initiallyExpanded: _showAdvancedSpecs,
              onExpansionChanged: (expanded) {
                setState(() {
                  _showAdvancedSpecs = expanded;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _rgFactoryController,
                        decoration: const InputDecoration(
                          labelText: 'RG (Factory)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _diffFactoryController,
                        decoration: const InputDecoration(
                          labelText: 'Differential (Factory)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _rgAfterController,
                        decoration: const InputDecoration(
                          labelText: 'RG (After Drilling)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _diffAfterController,
                        decoration: const InputDecoration(
                          labelText: 'Differential (After Drilling)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // PAP Configuration (collapsible)
            ExpansionTile(
              title: const Text('PAP Configuration'),
              initiallyExpanded: _showPapConfig,
              onExpansionChanged: (expanded) {
                setState(() {
                  _showPapConfig = expanded;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _papOverController,
                        decoration: const InputDecoration(
                          labelText: 'PAP Over',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _papUpController,
                        decoration: const InputDecoration(
                          labelText: 'PAP Up',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedPapUnit,
                        decoration: const InputDecoration(
                          labelText: 'PAP Unit',
                          border: OutlineInputBorder(),
                        ),
                        items: AppConstants.papUnits.map((unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedPapUnit = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedPapHand,
                        decoration: const InputDecoration(
                          labelText: 'PAP Hand',
                          border: OutlineInputBorder(),
                        ),
                        items: AppConstants.papHands.map((hand) {
                          return DropdownMenuItem(
                            value: hand,
                            child: Text(hand),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedPapHand = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ),
    );
  }
}
