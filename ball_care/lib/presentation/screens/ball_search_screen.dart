import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/bowwwl_ball.dart';
import '../../data/services/bowwwl_api_service.dart';

/// Screen for searching bowling balls from the bowwwl.com database
class BallSearchScreen extends ConsumerStatefulWidget {
  const BallSearchScreen({super.key});

  @override
  ConsumerState<BallSearchScreen> createState() => _BallSearchScreenState();
}

class _BallSearchScreenState extends ConsumerState<BallSearchScreen> {
  final _apiService = BowwwlApiService();
  final _searchController = TextEditingController();

  List<BowwwlBall> _searchResults = [];
  List<Map<String, dynamic>> _brands = [];
  String? _selectedBrand;
  bool _isLoading = false;
  bool _isInitialLoad = true;
  String? _errorMessage;
  String? _searchProgress;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = true;
      _isInitialLoad = true;
      _errorMessage = null;
    });

    try {
      // Load first page of balls and brands
      final balls = await _apiService.fetchBalls(page: 0);
      final brands = await _apiService.fetchBrands();

      setState(() {
        _searchResults = balls;
        _brands = brands;
        _isLoading = false;
        _isInitialLoad = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load data: $e';
        _isLoading = false;
        _isInitialLoad = false;
      });
    }
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _searchProgress = null;
    });

    try {
      List<BowwwlBall> results;

      if (_searchController.text.isEmpty && _selectedBrand == null) {
        // No filters, load first page
        results = await _apiService.fetchBalls(page: 0);
      } else if (_selectedBrand != null && _searchController.text.isEmpty) {
        // Filter by brand only
        results = await _apiService.fetchBalls(brand: _selectedBrand);
      } else {
        // Search by name (searches through ALL pages)
        results = await _apiService.searchBallsByName(
          _searchController.text,
          onProgress: (page, found) {
            setState(() {
              _searchProgress = 'Searching page ${page + 1}... ($found found)';
            });
          },
        );

        // Apply brand filter if selected
        if (_selectedBrand != null) {
          results = results
              .where((ball) =>
                  ball.brandName?.toLowerCase() == _selectedBrand?.toLowerCase())
              .toList();
        }
      }

      setState(() {
        _searchResults = results;
        _isLoading = false;
        _searchProgress = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Search failed: $e';
        _isLoading = false;
        _searchProgress = null;
      });
    }
  }

  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _selectedBrand = null;
    });
    _loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Ball Database'),
        actions: [
          if (_searchController.text.isNotEmpty || _selectedBrand != null)
            IconButton(
              icon: const Icon(Icons.clear),
              tooltip: 'Clear filters',
              onPressed: _clearFilters,
            ),
        ],
      ),
      body: Column(
        children: [
          // Search and filter section
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              children: [
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by ball name...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _performSearch();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  onSubmitted: (_) => _performSearch(),
                ),
                const SizedBox(height: 12),
                // Brand filter
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedBrand,
                        decoration: InputDecoration(
                          labelText: 'Filter by Brand',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        items: [
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text('All Brands'),
                          ),
                          ..._brands.map((brand) {
                            return DropdownMenuItem<String>(
                              value: brand['brand_name'] as String,
                              child: Text(brand['brand_name'] as String),
                            );
                          }),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedBrand = value;
                          });
                          _performSearch();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _performSearch,
                      icon: const Icon(Icons.search),
                      label: const Text('Search'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Results section
          Expanded(
            child: _buildResultsSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsSection() {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadInitialData,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_isLoading && _isInitialLoad) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(_searchProgress ?? 'Loading ball database...'),
          ],
        ),
      );
    }

    if (_isLoading && !_isInitialLoad) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(_searchProgress ?? 'Searching...'),
            const SizedBox(height: 8),
            Text(
              'This may take a moment',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No balls found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search filters',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            final ball = _searchResults[index];
            return _buildBallCard(ball);
          },
        ),
        if (_isLoading && !_isInitialLoad)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(),
          ),
      ],
    );
  }

  Widget _buildBallCard(BowwwlBall ball) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(ball);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Ball image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: ball.fullThumbnailUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ball.fullThumbnailUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.sports_baseball, size: 40);
                          },
                        ),
                      )
                    : const Icon(Icons.sports_baseball, size: 40),
              ),
              const SizedBox(width: 16),
              // Ball info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ball.ballName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (ball.brandName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        ball.brandName!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        if (ball.coverstockType != null)
                          _buildChip(
                            ball.coverstockType!,
                            Icons.texture,
                          ),
                        if (ball.coreType != null)
                          _buildChip(
                            ball.coreType!,
                            Icons.album,
                          ),
                        if (ball.coreRg != null && ball.coreDiff != null)
                          _buildChip(
                            'RG: ${ball.coreRg} / Diff: ${ball.coreDiff}',
                            Icons.analytics,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(
        label,
        style: const TextStyle(fontSize: 11),
      ),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
