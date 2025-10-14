import 'package:flutter/material.dart';
import '../../core/constants/app_version.dart';

/// Version footer widget to display at the bottom of screens during debugging
class VersionFooter extends StatelessWidget {
  const VersionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        appVersion,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[500],
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
