import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/constants/app_constants.dart';
import '../../data/models/maintenance_status.dart';

class ProgressRing extends StatelessWidget {
  final MaintenanceStatus status;
  final double size;

  const ProgressRing({
    super.key,
    required this.status,
    this.size = AppConstants.progressRingSmallSize,
  });

  Color get _color {
    switch (status.status) {
      case StatusLevel.good:
        return AppConstants.goodColor;
      case StatusLevel.warning:
        return AppConstants.warningColor;
      case StatusLevel.critical:
        return AppConstants.criticalColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cap progress at 100% for visual display
    final visualProgress = math.min(status.percentage / 100, 1.0);
    // Scale stroke width based on size
    final strokeWidth = size < 60 ? 4.0 : AppConstants.progressRingThickness;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[200]!),
            ),
          ),
          // Progress circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: visualProgress,
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(_color),
            ),
          ),
          // Center content (hide for very small rings)
          if (size >= 60)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  status.gamesSince.toStringAsFixed(status.gamesSince.truncateToDouble() == status.gamesSince ? 0 : 1),
                  style: TextStyle(
                    fontSize: size * 0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/ ${status.threshold.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: size * 0.12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class ProgressRingWithLabel extends StatelessWidget {
  final MaintenanceStatus status;
  final double size;

  const ProgressRingWithLabel({
    super.key,
    required this.status,
    this.size = AppConstants.progressRingSmallSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProgressRing(
          status: status,
          size: size,
        ),
        const SizedBox(height: 8),
        Text(
          status.displayName,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
