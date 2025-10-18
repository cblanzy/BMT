import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:image_picker/image_picker.dart';
import '../../core/constants/app_constants.dart';
import '../../data/database/database.dart';
import '../../data/providers/providers.dart';
import '../../data/models/bowwwl_ball.dart';
import '../../data/services/image_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/background_image.dart';
import '../widgets/styled_form_field.dart';
import 'ball_search_screen.dart';

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
  final _deepCleanGamesController = TextEditingController();
  final _oilExtractGamesController = TextEditingController();
  final _resurfaceGamesController = TextEditingController();

  String? _selectedCoverstock;
  double? _selectedWeight;
  String _selectedPapUnit = 'in';
  String? _selectedPapHand;
  String? _imageData;
  bool _showAdvancedSpecs = false;
  bool _showPapConfig = false;
  bool _showMaintenanceOverride = false;
  bool _useCustomDeepClean = false;
  bool _useCustomOilExtract = false;
  bool _useCustomResurface = false;
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
    _deepCleanGamesController.dispose();
    _oilExtractGamesController.dispose();
    _resurfaceGamesController.dispose();
    super.dispose();
  }

  Future<void> _showImageSourceDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Photo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () => Navigator.pop(context, 'camera'),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () => Navigator.pop(context, 'gallery'),
              ),
            ],
          ),
        );
      },
    );

    if (result != null) {
      final imageService = ref.read(imageServiceProvider);
      XFile? pickedFile;

      if (result == 'camera') {
        pickedFile = await imageService.takePhoto();
      } else {
        pickedFile = await imageService.pickImage();
      }

      if (pickedFile != null) {
        final processedImage = await imageService.processImage(pickedFile);
        setState(() {
          _imageData = processedImage;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    await _showImageSourceDialog();
  }

  Future<void> _openBallSearch() async {
    print('=== STEP 1: Opening ball search screen');
    final selectedBall = await Navigator.of(context).push<BowwwlBall>(
      MaterialPageRoute(
        builder: (context) => const BallSearchScreen(),
      ),
    );

    print('=== STEP 2: Ball search returned');
    print('=== STEP 2a: Selected ball: ${selectedBall?.ballName}');
    print('=== STEP 2b: Mounted: $mounted');
    print('=== STEP 2c: Has image URL: ${selectedBall?.fullBallImageUrl != null}');

    if (selectedBall != null && mounted) {
      print('=== STEP 3: Calling _populateFromBowwwlBall');
      await _populateFromBowwwlBall(selectedBall);
      print('=== STEP 4: _populateFromBowwwlBall completed');
    }
  }

  Future<void> _populateFromBowwwlBall(BowwwlBall ball) async {
    try {
      print('=== POPULATE STEP 1: Starting population');

      // Populate all fields in setState to trigger rebuild
      if (mounted) {
        print('=== POPULATE STEP 2: Setting state with ball data');
        setState(() {
          // Populate text fields
          _nameController.text = ball.ballName;
          if (ball.brandName != null) {
            _brandController.text = ball.brandName!;
          }
          if (ball.factoryFinish != null) {
            _factoryFinishController.text = ball.factoryFinish!;
          }
          if (ball.coreRg != null) {
            _rgFactoryController.text = ball.coreRg!;
          }
          if (ball.coreDiff != null) {
            _diffFactoryController.text = ball.coreDiff!;
          }

          // Set coverstock type (mapped)
          if (ball.mappedCoverstockType != null) {
            _selectedCoverstock = ball.mappedCoverstockType;
          }

          // Set weight
          if (ball.weightAsDouble != null) {
            _selectedWeight = ball.weightAsDouble;
          }
        });
        print('=== POPULATE STEP 3: setState completed');
      }

      // TEMPORARILY DISABLED: Image download to debug grey screen issue
      // Schedule image download AFTER the current frame is rendered
      // This ensures the form is fully visible before we start downloading
      // if (ball.fullBallImageUrl != null && mounted) {
      //   print('=== POPULATE STEP 4: Scheduling image download');
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     if (mounted) {
      //       print('=== POPULATE STEP 5: Post-frame callback - starting image download');
      //       _downloadBallImage(ball.fullBallImageUrl!);
      //     }
      //   });
      // }

      print('=== POPULATE STEP 6: Showing success snackbar');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ball data loaded successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      print('=== POPULATE STEP 7: Population function complete');
    } catch (e) {
      print('=== POPULATE ERROR: $e');
      print('=== POPULATE ERROR STACK: ${StackTrace.current}');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading ball data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Download ball image in background without blocking UI
  Future<void> _downloadBallImage(String imageUrl) async {
    print('=== IMAGE DOWNLOAD: Starting download from $imageUrl');
    try {
      final response = await http.get(Uri.parse(imageUrl)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Image download timed out');
        },
      );

      print('=== IMAGE DOWNLOAD: Response status ${response.statusCode}');
      if (response.statusCode == 200 && mounted) {
        print('=== IMAGE DOWNLOAD: Encoding image to base64');
        final base64Image = base64Encode(response.bodyBytes);
        print('=== IMAGE DOWNLOAD: Setting state with image data');
        setState(() {
          _imageData = base64Image;
        });
        print('=== IMAGE DOWNLOAD: Image set successfully');
      }
    } catch (e) {
      print('=== IMAGE DOWNLOAD ERROR: $e');
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
        deepCleanGames: Value(_useCustomDeepClean && _deepCleanGamesController.text.trim().isNotEmpty ? int.tryParse(_deepCleanGamesController.text.trim()) : null),
        oilExtractGames: Value(_useCustomOilExtract && _oilExtractGamesController.text.trim().isNotEmpty ? int.tryParse(_oilExtractGamesController.text.trim()) : null),
        resurfaceGames: Value(_useCustomResurface && _resurfaceGamesController.text.trim().isNotEmpty ? int.tryParse(_resurfaceGamesController.text.trim()) : null),
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
          else ...[
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: _saveBall,
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

            // Search Ball Database button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openBallSearch,
                icon: const Icon(Icons.search),
                label: const Text('Search Ball Database'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Or enter ball details manually below',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Name (required)
            StyledFormField(
              controller: _nameController,
              labelText: 'Ball Name *',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Brand
            StyledFormField(
              controller: _brandController,
              labelText: 'Brand',
            ),
            const SizedBox(height: 16),

            // Weight
            StyledDropdownFormField<double>(
              value: _selectedWeight,
              labelText: 'Weight (lbs)',
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
            StyledDropdownFormField<String>(
              value: _selectedCoverstock,
              labelText: 'Coverstock',
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
            StyledFormField(
              controller: _factoryFinishController,
              labelText: 'Factory Finish',
              hintText: 'e.g., 1500 polished',
            ),
            const SizedBox(height: 16),

            // Serial Number
            StyledFormField(
              controller: _serialController,
              labelText: 'Serial Number',
            ),
            const SizedBox(height: 24),

            // Advanced Specs (collapsible)
            Card(
              child: ExpansionTile(
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
                        StyledFormField(
                          controller: _rgFactoryController,
                          labelText: 'RG (Factory)',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 16),
                        StyledFormField(
                          controller: _diffFactoryController,
                          labelText: 'Differential (Factory)',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 16),
                        StyledFormField(
                          controller: _rgAfterController,
                          labelText: 'RG (After Drilling)',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 16),
                        StyledFormField(
                          controller: _diffAfterController,
                          labelText: 'Differential (After Drilling)',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // PAP Configuration (collapsible)
            Card(
              child: ExpansionTile(
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
                        StyledFormField(
                          controller: _papOverController,
                          labelText: 'PAP Over',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 16),
                        StyledFormField(
                          controller: _papUpController,
                          labelText: 'PAP Up',
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 16),
                        StyledDropdownFormField<String>(
                          value: _selectedPapUnit,
                          labelText: 'PAP Unit',
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
                        StyledDropdownFormField<String>(
                          value: _selectedPapHand,
                          labelText: 'PAP Hand',
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
            ),
            const SizedBox(height: 8),

            // Maintenance Schedule Override (collapsible)
            Card(
              child: ExpansionTile(
                title: const Text('Maintenance Schedule Override'),
                initiallyExpanded: _showMaintenanceOverride,
                onExpansionChanged: (expanded) {
                  setState(() {
                    _showMaintenanceOverride = expanded;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Override the default maintenance schedules for this specific ball. Leave unchecked to use global defaults.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Deep Clean Override
                        CheckboxListTile(
                          title: const Text('Custom Deep Clean Schedule'),
                          value: _useCustomDeepClean,
                          onChanged: (value) {
                            setState(() {
                              _useCustomDeepClean = value ?? false;
                              if (!_useCustomDeepClean) {
                                _deepCleanGamesController.clear();
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                        if (_useCustomDeepClean) ...[
                          StyledFormField(
                            controller: _deepCleanGamesController,
                            labelText: 'Deep Clean Games',
                            hintText: 'Default: 18 games',
                            keyboardType: const TextInputType.numberWithOptions(decimal: false),
                            validator: (value) {
                              if (_useCustomDeepClean && (value == null || value.trim().isEmpty)) {
                                return 'Please enter a value or uncheck the override';
                              }
                              if (value != null && value.trim().isNotEmpty) {
                                final parsed = int.tryParse(value.trim());
                                if (parsed == null || parsed <= 0) {
                                  return 'Please enter a valid positive number';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Oil Extract Override
                        CheckboxListTile(
                          title: const Text('Custom Oil Extract Schedule'),
                          value: _useCustomOilExtract,
                          onChanged: (value) {
                            setState(() {
                              _useCustomOilExtract = value ?? false;
                              if (!_useCustomOilExtract) {
                                _oilExtractGamesController.clear();
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                        if (_useCustomOilExtract) ...[
                          StyledFormField(
                            controller: _oilExtractGamesController,
                            labelText: 'Oil Extract Games',
                            hintText: 'Default: 70 games',
                            keyboardType: const TextInputType.numberWithOptions(decimal: false),
                            validator: (value) {
                              if (_useCustomOilExtract && (value == null || value.trim().isEmpty)) {
                                return 'Please enter a value or uncheck the override';
                              }
                              if (value != null && value.trim().isNotEmpty) {
                                final parsed = int.tryParse(value.trim());
                                if (parsed == null || parsed <= 0) {
                                  return 'Please enter a valid positive number';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                        ],

                        // Resurface Override
                        CheckboxListTile(
                          title: const Text('Custom Resurface Schedule'),
                          value: _useCustomResurface,
                          onChanged: (value) {
                            setState(() {
                              _useCustomResurface = value ?? false;
                              if (!_useCustomResurface) {
                                _resurfaceGamesController.clear();
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                        if (_useCustomResurface) ...[
                          StyledFormField(
                            controller: _resurfaceGamesController,
                            labelText: 'Resurface Games',
                            hintText: 'Default: varies by coverstock',
                            keyboardType: const TextInputType.numberWithOptions(decimal: false),
                            validator: (value) {
                              if (_useCustomResurface && (value == null || value.trim().isEmpty)) {
                                return 'Please enter a value or uncheck the override';
                              }
                              if (value != null && value.trim().isNotEmpty) {
                                final parsed = int.tryParse(value.trim());
                                if (parsed == null || parsed <= 0) {
                                  return 'Please enter a valid positive number';
                                }
                              }
                              return null;
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ),
    );
  }
}
