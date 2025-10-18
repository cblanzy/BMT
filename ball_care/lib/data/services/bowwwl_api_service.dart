import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bowwwl_ball.dart';

/// Service for interacting with the bowwwl.com bowling ball database API
class BowwwlApiService {
  static const String _baseUrl = 'https://www.bowwwl.com/restapi';

  // CORS proxy - use this for web builds to bypass CORS restrictions
  // For production, configure CORS on bowwwl.com or use your own backend
  static const String _corsProxy = 'https://corsproxy.io/?';

  /// Get the full URL with CORS proxy for web requests
  String _getProxiedUrl(String url) {
    // Use CORS proxy for web builds to bypass browser CORS restrictions
    return '$_corsProxy${Uri.encodeComponent(url)}';
  }

  /// Fetch balls from the v2 API with pagination and optional filters
  ///
  /// Parameters:
  /// - [page]: Page number (0-indexed), each page has 100 results
  /// - [brand]: Filter by brand name (e.g., "storm", "brunswick")
  /// - [core]: Filter by core name
  /// - [coverstock]: Filter by coverstock name
  /// - [weight]: Weight for core specs (default: 15)
  Future<List<BowwwlBall>> fetchBalls({
    int page = 0,
    String? brand,
    String? core,
    String? coverstock,
    int weight = 15,
  }) async {
    try {
      // Build query parameters
      final queryParams = <String, String>{
        'page': page.toString(),
      };

      if (brand != null && brand.isNotEmpty) {
        queryParams['brand'] = brand;
      }
      if (core != null && core.isNotEmpty) {
        queryParams['core'] = core;
      }
      if (coverstock != null && coverstock.isNotEmpty) {
        queryParams['coverstock'] = coverstock;
      }

      final uri = Uri.parse('$_baseUrl/balls/v2').replace(
        queryParameters: queryParams,
      );

      // Use CORS proxy for web builds
      final proxiedUrl = _getProxiedUrl(uri.toString());
      final response = await http.get(Uri.parse(proxiedUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => BowwwlBall.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load balls: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching balls: $e');
    }
  }

  /// Search balls by name (client-side filtering since API doesn't support name search)
  ///
  /// This searches through ALL pages of the API until no more results are found.
  /// Progress callback can be used to show loading progress to the user.
  Future<List<BowwwlBall>> searchBallsByName(
    String query, {
    Function(int currentPage, int totalFound)? onProgress,
  }) async {
    if (query.isEmpty) {
      return fetchBalls(page: 0);
    }

    final results = <BowwwlBall>[];
    final queryLower = query.toLowerCase();
    int page = 0;

    // Search through ALL pages until we run out of results
    while (true) {
      try {
        final balls = await fetchBalls(page: page);

        if (balls.isEmpty) break; // No more results

        // Filter by name or brand
        final matches = balls.where((ball) =>
          ball.ballName.toLowerCase().contains(queryLower) ||
          (ball.brandName?.toLowerCase().contains(queryLower) ?? false)
        ).toList();

        results.addAll(matches);

        // Call progress callback if provided
        if (onProgress != null) {
          onProgress(page, results.length);
        }

        page++;

        // Safety limit: don't search more than 100 pages (10,000 balls)
        if (page >= 100) break;

      } catch (e) {
        // If we get an error, return what we have so far
        break;
      }
    }

    return results;
  }

  /// Fetch all available brands
  Future<List<Map<String, dynamic>>> fetchBrands() async {
    try {
      final uri = Uri.parse('$_baseUrl/brands');
      final proxiedUrl = _getProxiedUrl(uri.toString());
      final response = await http.get(Uri.parse(proxiedUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load brands: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching brands: $e');
    }
  }

  /// Fetch all available cores
  Future<List<Map<String, dynamic>>> fetchCores() async {
    try {
      final uri = Uri.parse('$_baseUrl/cores');
      final proxiedUrl = _getProxiedUrl(uri.toString());
      final response = await http.get(Uri.parse(proxiedUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load cores: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cores: $e');
    }
  }

  /// Fetch all available coverstocks
  Future<List<Map<String, dynamic>>> fetchCoverstocks() async {
    try {
      final uri = Uri.parse('$_baseUrl/coverstocks');
      final proxiedUrl = _getProxiedUrl(uri.toString());
      final response = await http.get(Uri.parse(proxiedUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load coverstocks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching coverstocks: $e');
    }
  }
}
