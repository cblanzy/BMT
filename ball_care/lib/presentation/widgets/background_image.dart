import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

/// A widget that displays a background image with optional overlay
/// The image path should be 'assets/images/background.jpg' or .png
class BackgroundImage extends StatelessWidget {
  final Widget child;
  final double opacity;
  final Color? overlayColor;
  final double? overlayOpacity;

  const BackgroundImage({
    super.key,
    required this.child,
    this.opacity = 0.08,
    this.overlayColor,
    this.overlayOpacity,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveOverlayColor = overlayColor ?? Colors.black;
    final effectiveOverlayOpacity = overlayOpacity ?? (isDark ? 0.1 : 0.2);

    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: _buildBackgroundImage(),
        ),
        // Optional overlay for better text readability
        if (effectiveOverlayOpacity > 0)
          Positioned.fill(
            child: Container(
              color: effectiveOverlayColor.withOpacity(effectiveOverlayOpacity),
            ),
          ),
        // Content
        child,
      ],
    );
  }

  Widget _buildBackgroundImage() {
    // Try to load the image, fallback to solid color if not found
    return Image.asset(
      'assets/images/background.jpg',
      fit: BoxFit.cover,
      opacity: AlwaysStoppedAnimation(opacity),
      errorBuilder: (context, error, stackTrace) {
        // Try PNG if JPG fails
        return Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
          opacity: AlwaysStoppedAnimation(opacity),
          errorBuilder: (context, error, stackTrace) {
            // If both fail, return a subtle gradient background
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey[900]!,
                    Colors.grey[800]!,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Alternative widget that allows custom image path
class CustomBackgroundImage extends StatelessWidget {
  final Widget child;
  final String imagePath;
  final double opacity;
  final Color? overlayColor;
  final double? overlayOpacity;
  final BoxFit fit;

  const CustomBackgroundImage({
    super.key,
    required this.child,
    required this.imagePath,
    this.opacity = 0.08,
    this.overlayColor,
    this.overlayOpacity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveOverlayColor = overlayColor ?? Colors.black;
    final effectiveOverlayOpacity = overlayOpacity ?? (isDark ? 0.1 : 0.2);

    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: fit,
            opacity: AlwaysStoppedAnimation(opacity),
            errorBuilder: (context, error, stackTrace) {
              // Fallback to subtle gradient if image not found
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey[900]!,
                      Colors.grey[800]!,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Optional overlay
        if (effectiveOverlayOpacity > 0)
          Positioned.fill(
            child: Container(
              color: effectiveOverlayColor.withOpacity(effectiveOverlayOpacity),
            ),
          ),
        // Content
        child,
      ],
    );
  }
}
