import 'package:flutter/material.dart';

class AppConstants {
  // Colors for progress indicators
  static const Color goodColor = Color(0xFF4CAF50); // Green
  static const Color warningColor = Color(0xFFFFC107); // Yellow
  static const Color criticalColor = Color(0xFFF44336); // Red

  // Progress ring sizes
  static const double progressRingSmallSize = 80.0;
  static const double progressRingLargeSize = 100.0;
  static const double progressRingThickness = 8.0;

  // Image sizes
  static const double ballImageThumbnailSize = 60.0;
  static const double ballImageMediumSize = 120.0;

  // Border radius
  static const double thumbnailBorderRadius = 8.0;
  static const double cardBorderRadius = 12.0;

  // Default maintenance intervals
  static const int defaultDeepCleanGames = 18;
  static const int defaultOilExtractGames = 70;
  static const int defaultResurfaceUrethaneGames = 90;
  static const int defaultResurfaceReactiveSolidGames = 70;
  static const int defaultResurfaceReactivePearlGames = 80;
  static const int defaultResurfaceReactiveHybridGames = 80;

  // Status thresholds
  static const double warningThreshold = 0.8; // 80%
  static const double criticalThreshold = 1.0; // 100%

  // Coverstock types
  static const List<String> coverstockTypes = [
    'Urethane',
    'Reactive Solid',
    'Reactive Pearl',
    'Reactive Hybrid',
  ];

  // Weight options (in pounds)
  static const List<double> weightOptions = [
    10.0,
    11.0,
    12.0,
    13.0,
    14.0,
    15.0,
    16.0,
  ];

  // PAP units
  static const List<String> papUnits = ['in', 'cm'];

  // PAP hands
  static const List<String> papHands = ['Left', 'Right', 'Unknown'];
}
