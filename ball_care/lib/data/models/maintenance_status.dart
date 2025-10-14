enum MaintenanceType {
  deepClean('deep_clean'),
  oilExtract('oil_extract'),
  resurface('resurface');

  final String value;
  const MaintenanceType(this.value);

  static MaintenanceType fromString(String value) {
    switch (value) {
      case 'deep_clean':
        return MaintenanceType.deepClean;
      case 'oil_extract':
        return MaintenanceType.oilExtract;
      case 'resurface':
        return MaintenanceType.resurface;
      default:
        throw ArgumentError('Invalid maintenance type: $value');
    }
  }
}

enum StatusLevel {
  good, // < 80%
  warning, // 80-100%
  critical // > 100%
}

class MaintenanceStatus {
  final MaintenanceType type;
  final double gamesSince;
  final double threshold;
  final double percentage;
  final StatusLevel status;

  MaintenanceStatus({
    required this.type,
    required this.gamesSince,
    required this.threshold,
  })  : percentage = threshold > 0 ? (gamesSince / threshold) * 100 : 0,
        status = threshold > 0
            ? (gamesSince / threshold) < 0.8
                ? StatusLevel.good
                : (gamesSince / threshold) <= 1.0
                    ? StatusLevel.warning
                    : StatusLevel.critical
            : StatusLevel.good;

  // Helper getter for display
  String get displayName {
    switch (type) {
      case MaintenanceType.deepClean:
        return 'Deep Clean';
      case MaintenanceType.oilExtract:
        return 'Oil Extract';
      case MaintenanceType.resurface:
        return 'Resurface';
    }
  }
}
