/// Model class for bowling balls from the bowwwl.com API
class BowwwlBall {
  final String ballId;
  final String ballName;
  final String? brandName;
  final String? brandId;
  final String? factoryFinish;
  final String? coreId;
  final String? coreName;
  final String? coreType;
  final String? coreWeight;
  final String? coreRg;
  final String? coreDiff;
  final String? coreIntDiff;
  final String? coverstockName;
  final String? coverstockId;
  final String? coverstockType;
  final String? thumbnailImage;
  final String? ballImage;
  final String? coreImage;
  final String? releaseDate;
  final String? lastUpdate;
  final String? usInt;
  final String? availability;

  BowwwlBall({
    required this.ballId,
    required this.ballName,
    this.brandName,
    this.brandId,
    this.factoryFinish,
    this.coreId,
    this.coreName,
    this.coreType,
    this.coreWeight,
    this.coreRg,
    this.coreDiff,
    this.coreIntDiff,
    this.coverstockName,
    this.coverstockId,
    this.coverstockType,
    this.thumbnailImage,
    this.ballImage,
    this.coreImage,
    this.releaseDate,
    this.lastUpdate,
    this.usInt,
    this.availability,
  });

  factory BowwwlBall.fromJson(Map<String, dynamic> json) {
    return BowwwlBall(
      ballId: json['ball_id'] as String,
      ballName: json['ball_name'] as String,
      brandName: json['brand_name'] as String?,
      brandId: json['brand_id'] as String?,
      factoryFinish: json['factory_finish'] as String?,
      coreId: json['core_id'] as String?,
      coreName: json['core_name'] as String?,
      coreType: json['core_type'] as String?,
      coreWeight: json['core_weight'] as String?,
      coreRg: json['core_rg'] as String?,
      coreDiff: json['core_diff'] as String?,
      coreIntDiff: json['core_int_diff'] as String?,
      coverstockName: json['coverstock_name'] as String?,
      coverstockId: json['coverstock_id'] as String?,
      coverstockType: json['coverstock_type'] as String?,
      thumbnailImage: json['thumbnail_image'] as String?,
      ballImage: json['ball_image'] as String?,
      coreImage: json['core_image'] as String?,
      releaseDate: json['release_date'] as String?,
      lastUpdate: json['last_update'] as String?,
      usInt: json['us_int'] as String?,
      availability: json['availability'] as String?,
    );
  }

  /// Get the full URL for the ball image
  String? get fullBallImageUrl {
    if (ballImage == null || ballImage!.isEmpty) return null;
    return 'https://www.bowwwl.com$ballImage';
  }

  /// Get the full URL for the thumbnail image
  String? get fullThumbnailUrl {
    if (thumbnailImage == null || thumbnailImage!.isEmpty) return null;
    return 'https://www.bowwwl.com$thumbnailImage';
  }

  /// Map coverstock type from API to database format
  /// Returns the coverstock type in the format expected by the app
  String? get mappedCoverstockType {
    if (coverstockType == null) return null;

    final type = coverstockType!.toLowerCase();
    if (type.contains('solid reactive') || type.contains('reactive solid')) {
      return 'Reactive Solid';
    } else if (type.contains('pearl reactive') || type.contains('reactive pearl')) {
      return 'Reactive Pearl';
    } else if (type.contains('hybrid reactive') || type.contains('reactive hybrid')) {
      return 'Reactive Hybrid';
    } else if (type.contains('urethane')) {
      return 'Urethane';
    }
    return null;
  }

  /// Parse RG as double
  double? get rgAsDouble {
    if (coreRg == null || coreRg!.isEmpty) return null;
    return double.tryParse(coreRg!);
  }

  /// Parse differential as double
  double? get diffAsDouble {
    if (coreDiff == null || coreDiff!.isEmpty) return null;
    return double.tryParse(coreDiff!);
  }

  /// Parse intermediate differential as double
  double? get intDiffAsDouble {
    if (coreIntDiff == null || coreIntDiff!.isEmpty) return null;
    return double.tryParse(coreIntDiff!);
  }

  /// Parse weight as double
  double? get weightAsDouble {
    if (coreWeight == null || coreWeight!.isEmpty) return null;
    return double.tryParse(coreWeight!);
  }
}
