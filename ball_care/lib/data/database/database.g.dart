// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BallsTable extends Balls with TableInfo<$BallsTable, Ball> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BallsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ballIdMeta = const VerificationMeta('ballId');
  @override
  late final GeneratedColumn<String> ballId = GeneratedColumn<String>(
    'ball_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverstockMeta = const VerificationMeta(
    'coverstock',
  );
  @override
  late final GeneratedColumn<String> coverstock = GeneratedColumn<String>(
    'coverstock',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _factoryFinishMeta = const VerificationMeta(
    'factoryFinish',
  );
  @override
  late final GeneratedColumn<String> factoryFinish = GeneratedColumn<String>(
    'factory_finish',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rgFactoryMeta = const VerificationMeta(
    'rgFactory',
  );
  @override
  late final GeneratedColumn<double> rgFactory = GeneratedColumn<double>(
    'rg_factory',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diffFactoryMeta = const VerificationMeta(
    'diffFactory',
  );
  @override
  late final GeneratedColumn<double> diffFactory = GeneratedColumn<double>(
    'diff_factory',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rgAfterMeta = const VerificationMeta(
    'rgAfter',
  );
  @override
  late final GeneratedColumn<double> rgAfter = GeneratedColumn<double>(
    'rg_after',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diffAfterMeta = const VerificationMeta(
    'diffAfter',
  );
  @override
  late final GeneratedColumn<double> diffAfter = GeneratedColumn<double>(
    'diff_after',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _papOverMeta = const VerificationMeta(
    'papOver',
  );
  @override
  late final GeneratedColumn<double> papOver = GeneratedColumn<double>(
    'pap_over',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _papUpMeta = const VerificationMeta('papUp');
  @override
  late final GeneratedColumn<double> papUp = GeneratedColumn<double>(
    'pap_up',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _papUnitMeta = const VerificationMeta(
    'papUnit',
  );
  @override
  late final GeneratedColumn<String> papUnit = GeneratedColumn<String>(
    'pap_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('in'),
  );
  static const VerificationMeta _papHandMeta = const VerificationMeta(
    'papHand',
  );
  @override
  late final GeneratedColumn<String> papHand = GeneratedColumn<String>(
    'pap_hand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specSourceMeta = const VerificationMeta(
    'specSource',
  );
  @override
  late final GeneratedColumn<String> specSource = GeneratedColumn<String>(
    'spec_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specConfidenceMeta = const VerificationMeta(
    'specConfidence',
  );
  @override
  late final GeneratedColumn<double> specConfidence = GeneratedColumn<double>(
    'spec_confidence',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightLbMeta = const VerificationMeta(
    'weightLb',
  );
  @override
  late final GeneratedColumn<double> weightLb = GeneratedColumn<double>(
    'weight_lb',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageLocalPathMeta = const VerificationMeta(
    'imageLocalPath',
  );
  @override
  late final GeneratedColumn<String> imageLocalPath = GeneratedColumn<String>(
    'image_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageBase64Meta = const VerificationMeta(
    'imageBase64',
  );
  @override
  late final GeneratedColumn<String> imageBase64 = GeneratedColumn<String>(
    'image_base64',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deepCleanGamesMeta = const VerificationMeta(
    'deepCleanGames',
  );
  @override
  late final GeneratedColumn<int> deepCleanGames = GeneratedColumn<int>(
    'deep_clean_games',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oilExtractGamesMeta = const VerificationMeta(
    'oilExtractGames',
  );
  @override
  late final GeneratedColumn<int> oilExtractGames = GeneratedColumn<int>(
    'oil_extract_games',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resurfaceGamesMeta = const VerificationMeta(
    'resurfaceGames',
  );
  @override
  late final GeneratedColumn<int> resurfaceGames = GeneratedColumn<int>(
    'resurface_games',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    ballId,
    name,
    brand,
    coverstock,
    factoryFinish,
    rgFactory,
    diffFactory,
    rgAfter,
    diffAfter,
    papOver,
    papUp,
    papUnit,
    papHand,
    specSource,
    specConfidence,
    weightLb,
    serial,
    imageLocalPath,
    imageUrl,
    imageBase64,
    deepCleanGames,
    oilExtractGames,
    resurfaceGames,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'balls';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ball> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ball_id')) {
      context.handle(
        _ballIdMeta,
        ballId.isAcceptableOrUnknown(data['ball_id']!, _ballIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ballIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('coverstock')) {
      context.handle(
        _coverstockMeta,
        coverstock.isAcceptableOrUnknown(data['coverstock']!, _coverstockMeta),
      );
    }
    if (data.containsKey('factory_finish')) {
      context.handle(
        _factoryFinishMeta,
        factoryFinish.isAcceptableOrUnknown(
          data['factory_finish']!,
          _factoryFinishMeta,
        ),
      );
    }
    if (data.containsKey('rg_factory')) {
      context.handle(
        _rgFactoryMeta,
        rgFactory.isAcceptableOrUnknown(data['rg_factory']!, _rgFactoryMeta),
      );
    }
    if (data.containsKey('diff_factory')) {
      context.handle(
        _diffFactoryMeta,
        diffFactory.isAcceptableOrUnknown(
          data['diff_factory']!,
          _diffFactoryMeta,
        ),
      );
    }
    if (data.containsKey('rg_after')) {
      context.handle(
        _rgAfterMeta,
        rgAfter.isAcceptableOrUnknown(data['rg_after']!, _rgAfterMeta),
      );
    }
    if (data.containsKey('diff_after')) {
      context.handle(
        _diffAfterMeta,
        diffAfter.isAcceptableOrUnknown(data['diff_after']!, _diffAfterMeta),
      );
    }
    if (data.containsKey('pap_over')) {
      context.handle(
        _papOverMeta,
        papOver.isAcceptableOrUnknown(data['pap_over']!, _papOverMeta),
      );
    }
    if (data.containsKey('pap_up')) {
      context.handle(
        _papUpMeta,
        papUp.isAcceptableOrUnknown(data['pap_up']!, _papUpMeta),
      );
    }
    if (data.containsKey('pap_unit')) {
      context.handle(
        _papUnitMeta,
        papUnit.isAcceptableOrUnknown(data['pap_unit']!, _papUnitMeta),
      );
    }
    if (data.containsKey('pap_hand')) {
      context.handle(
        _papHandMeta,
        papHand.isAcceptableOrUnknown(data['pap_hand']!, _papHandMeta),
      );
    }
    if (data.containsKey('spec_source')) {
      context.handle(
        _specSourceMeta,
        specSource.isAcceptableOrUnknown(data['spec_source']!, _specSourceMeta),
      );
    }
    if (data.containsKey('spec_confidence')) {
      context.handle(
        _specConfidenceMeta,
        specConfidence.isAcceptableOrUnknown(
          data['spec_confidence']!,
          _specConfidenceMeta,
        ),
      );
    }
    if (data.containsKey('weight_lb')) {
      context.handle(
        _weightLbMeta,
        weightLb.isAcceptableOrUnknown(data['weight_lb']!, _weightLbMeta),
      );
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    }
    if (data.containsKey('image_local_path')) {
      context.handle(
        _imageLocalPathMeta,
        imageLocalPath.isAcceptableOrUnknown(
          data['image_local_path']!,
          _imageLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('image_base64')) {
      context.handle(
        _imageBase64Meta,
        imageBase64.isAcceptableOrUnknown(
          data['image_base64']!,
          _imageBase64Meta,
        ),
      );
    }
    if (data.containsKey('deep_clean_games')) {
      context.handle(
        _deepCleanGamesMeta,
        deepCleanGames.isAcceptableOrUnknown(
          data['deep_clean_games']!,
          _deepCleanGamesMeta,
        ),
      );
    }
    if (data.containsKey('oil_extract_games')) {
      context.handle(
        _oilExtractGamesMeta,
        oilExtractGames.isAcceptableOrUnknown(
          data['oil_extract_games']!,
          _oilExtractGamesMeta,
        ),
      );
    }
    if (data.containsKey('resurface_games')) {
      context.handle(
        _resurfaceGamesMeta,
        resurfaceGames.isAcceptableOrUnknown(
          data['resurface_games']!,
          _resurfaceGamesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ballId};
  @override
  Ball map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ball(
      ballId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ball_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      coverstock: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coverstock'],
      ),
      factoryFinish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}factory_finish'],
      ),
      rgFactory: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rg_factory'],
      ),
      diffFactory: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diff_factory'],
      ),
      rgAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rg_after'],
      ),
      diffAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diff_after'],
      ),
      papOver: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pap_over'],
      ),
      papUp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pap_up'],
      ),
      papUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pap_unit'],
      )!,
      papHand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pap_hand'],
      ),
      specSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}spec_source'],
      ),
      specConfidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}spec_confidence'],
      ),
      weightLb: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_lb'],
      ),
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      ),
      imageLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_local_path'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      imageBase64: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_base64'],
      ),
      deepCleanGames: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deep_clean_games'],
      ),
      oilExtractGames: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}oil_extract_games'],
      ),
      resurfaceGames: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}resurface_games'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BallsTable createAlias(String alias) {
    return $BallsTable(attachedDatabase, alias);
  }
}

class Ball extends DataClass implements Insertable<Ball> {
  final String ballId;
  final String name;
  final String? brand;
  final String? coverstock;
  final String? factoryFinish;
  final double? rgFactory;
  final double? diffFactory;
  final double? rgAfter;
  final double? diffAfter;
  final double? papOver;
  final double? papUp;
  final String papUnit;
  final String? papHand;
  final String? specSource;
  final double? specConfidence;
  final double? weightLb;
  final String? serial;
  final String? imageLocalPath;
  final String? imageUrl;
  final String? imageBase64;
  final int? deepCleanGames;
  final int? oilExtractGames;
  final int? resurfaceGames;
  final int createdAt;
  final int updatedAt;
  const Ball({
    required this.ballId,
    required this.name,
    this.brand,
    this.coverstock,
    this.factoryFinish,
    this.rgFactory,
    this.diffFactory,
    this.rgAfter,
    this.diffAfter,
    this.papOver,
    this.papUp,
    required this.papUnit,
    this.papHand,
    this.specSource,
    this.specConfidence,
    this.weightLb,
    this.serial,
    this.imageLocalPath,
    this.imageUrl,
    this.imageBase64,
    this.deepCleanGames,
    this.oilExtractGames,
    this.resurfaceGames,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ball_id'] = Variable<String>(ballId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || coverstock != null) {
      map['coverstock'] = Variable<String>(coverstock);
    }
    if (!nullToAbsent || factoryFinish != null) {
      map['factory_finish'] = Variable<String>(factoryFinish);
    }
    if (!nullToAbsent || rgFactory != null) {
      map['rg_factory'] = Variable<double>(rgFactory);
    }
    if (!nullToAbsent || diffFactory != null) {
      map['diff_factory'] = Variable<double>(diffFactory);
    }
    if (!nullToAbsent || rgAfter != null) {
      map['rg_after'] = Variable<double>(rgAfter);
    }
    if (!nullToAbsent || diffAfter != null) {
      map['diff_after'] = Variable<double>(diffAfter);
    }
    if (!nullToAbsent || papOver != null) {
      map['pap_over'] = Variable<double>(papOver);
    }
    if (!nullToAbsent || papUp != null) {
      map['pap_up'] = Variable<double>(papUp);
    }
    map['pap_unit'] = Variable<String>(papUnit);
    if (!nullToAbsent || papHand != null) {
      map['pap_hand'] = Variable<String>(papHand);
    }
    if (!nullToAbsent || specSource != null) {
      map['spec_source'] = Variable<String>(specSource);
    }
    if (!nullToAbsent || specConfidence != null) {
      map['spec_confidence'] = Variable<double>(specConfidence);
    }
    if (!nullToAbsent || weightLb != null) {
      map['weight_lb'] = Variable<double>(weightLb);
    }
    if (!nullToAbsent || serial != null) {
      map['serial'] = Variable<String>(serial);
    }
    if (!nullToAbsent || imageLocalPath != null) {
      map['image_local_path'] = Variable<String>(imageLocalPath);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || imageBase64 != null) {
      map['image_base64'] = Variable<String>(imageBase64);
    }
    if (!nullToAbsent || deepCleanGames != null) {
      map['deep_clean_games'] = Variable<int>(deepCleanGames);
    }
    if (!nullToAbsent || oilExtractGames != null) {
      map['oil_extract_games'] = Variable<int>(oilExtractGames);
    }
    if (!nullToAbsent || resurfaceGames != null) {
      map['resurface_games'] = Variable<int>(resurfaceGames);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  BallsCompanion toCompanion(bool nullToAbsent) {
    return BallsCompanion(
      ballId: Value(ballId),
      name: Value(name),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      coverstock: coverstock == null && nullToAbsent
          ? const Value.absent()
          : Value(coverstock),
      factoryFinish: factoryFinish == null && nullToAbsent
          ? const Value.absent()
          : Value(factoryFinish),
      rgFactory: rgFactory == null && nullToAbsent
          ? const Value.absent()
          : Value(rgFactory),
      diffFactory: diffFactory == null && nullToAbsent
          ? const Value.absent()
          : Value(diffFactory),
      rgAfter: rgAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(rgAfter),
      diffAfter: diffAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(diffAfter),
      papOver: papOver == null && nullToAbsent
          ? const Value.absent()
          : Value(papOver),
      papUp: papUp == null && nullToAbsent
          ? const Value.absent()
          : Value(papUp),
      papUnit: Value(papUnit),
      papHand: papHand == null && nullToAbsent
          ? const Value.absent()
          : Value(papHand),
      specSource: specSource == null && nullToAbsent
          ? const Value.absent()
          : Value(specSource),
      specConfidence: specConfidence == null && nullToAbsent
          ? const Value.absent()
          : Value(specConfidence),
      weightLb: weightLb == null && nullToAbsent
          ? const Value.absent()
          : Value(weightLb),
      serial: serial == null && nullToAbsent
          ? const Value.absent()
          : Value(serial),
      imageLocalPath: imageLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(imageLocalPath),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      imageBase64: imageBase64 == null && nullToAbsent
          ? const Value.absent()
          : Value(imageBase64),
      deepCleanGames: deepCleanGames == null && nullToAbsent
          ? const Value.absent()
          : Value(deepCleanGames),
      oilExtractGames: oilExtractGames == null && nullToAbsent
          ? const Value.absent()
          : Value(oilExtractGames),
      resurfaceGames: resurfaceGames == null && nullToAbsent
          ? const Value.absent()
          : Value(resurfaceGames),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Ball.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ball(
      ballId: serializer.fromJson<String>(json['ballId']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      coverstock: serializer.fromJson<String?>(json['coverstock']),
      factoryFinish: serializer.fromJson<String?>(json['factoryFinish']),
      rgFactory: serializer.fromJson<double?>(json['rgFactory']),
      diffFactory: serializer.fromJson<double?>(json['diffFactory']),
      rgAfter: serializer.fromJson<double?>(json['rgAfter']),
      diffAfter: serializer.fromJson<double?>(json['diffAfter']),
      papOver: serializer.fromJson<double?>(json['papOver']),
      papUp: serializer.fromJson<double?>(json['papUp']),
      papUnit: serializer.fromJson<String>(json['papUnit']),
      papHand: serializer.fromJson<String?>(json['papHand']),
      specSource: serializer.fromJson<String?>(json['specSource']),
      specConfidence: serializer.fromJson<double?>(json['specConfidence']),
      weightLb: serializer.fromJson<double?>(json['weightLb']),
      serial: serializer.fromJson<String?>(json['serial']),
      imageLocalPath: serializer.fromJson<String?>(json['imageLocalPath']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      imageBase64: serializer.fromJson<String?>(json['imageBase64']),
      deepCleanGames: serializer.fromJson<int?>(json['deepCleanGames']),
      oilExtractGames: serializer.fromJson<int?>(json['oilExtractGames']),
      resurfaceGames: serializer.fromJson<int?>(json['resurfaceGames']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ballId': serializer.toJson<String>(ballId),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String?>(brand),
      'coverstock': serializer.toJson<String?>(coverstock),
      'factoryFinish': serializer.toJson<String?>(factoryFinish),
      'rgFactory': serializer.toJson<double?>(rgFactory),
      'diffFactory': serializer.toJson<double?>(diffFactory),
      'rgAfter': serializer.toJson<double?>(rgAfter),
      'diffAfter': serializer.toJson<double?>(diffAfter),
      'papOver': serializer.toJson<double?>(papOver),
      'papUp': serializer.toJson<double?>(papUp),
      'papUnit': serializer.toJson<String>(papUnit),
      'papHand': serializer.toJson<String?>(papHand),
      'specSource': serializer.toJson<String?>(specSource),
      'specConfidence': serializer.toJson<double?>(specConfidence),
      'weightLb': serializer.toJson<double?>(weightLb),
      'serial': serializer.toJson<String?>(serial),
      'imageLocalPath': serializer.toJson<String?>(imageLocalPath),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'imageBase64': serializer.toJson<String?>(imageBase64),
      'deepCleanGames': serializer.toJson<int?>(deepCleanGames),
      'oilExtractGames': serializer.toJson<int?>(oilExtractGames),
      'resurfaceGames': serializer.toJson<int?>(resurfaceGames),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Ball copyWith({
    String? ballId,
    String? name,
    Value<String?> brand = const Value.absent(),
    Value<String?> coverstock = const Value.absent(),
    Value<String?> factoryFinish = const Value.absent(),
    Value<double?> rgFactory = const Value.absent(),
    Value<double?> diffFactory = const Value.absent(),
    Value<double?> rgAfter = const Value.absent(),
    Value<double?> diffAfter = const Value.absent(),
    Value<double?> papOver = const Value.absent(),
    Value<double?> papUp = const Value.absent(),
    String? papUnit,
    Value<String?> papHand = const Value.absent(),
    Value<String?> specSource = const Value.absent(),
    Value<double?> specConfidence = const Value.absent(),
    Value<double?> weightLb = const Value.absent(),
    Value<String?> serial = const Value.absent(),
    Value<String?> imageLocalPath = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> imageBase64 = const Value.absent(),
    Value<int?> deepCleanGames = const Value.absent(),
    Value<int?> oilExtractGames = const Value.absent(),
    Value<int?> resurfaceGames = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => Ball(
    ballId: ballId ?? this.ballId,
    name: name ?? this.name,
    brand: brand.present ? brand.value : this.brand,
    coverstock: coverstock.present ? coverstock.value : this.coverstock,
    factoryFinish: factoryFinish.present
        ? factoryFinish.value
        : this.factoryFinish,
    rgFactory: rgFactory.present ? rgFactory.value : this.rgFactory,
    diffFactory: diffFactory.present ? diffFactory.value : this.diffFactory,
    rgAfter: rgAfter.present ? rgAfter.value : this.rgAfter,
    diffAfter: diffAfter.present ? diffAfter.value : this.diffAfter,
    papOver: papOver.present ? papOver.value : this.papOver,
    papUp: papUp.present ? papUp.value : this.papUp,
    papUnit: papUnit ?? this.papUnit,
    papHand: papHand.present ? papHand.value : this.papHand,
    specSource: specSource.present ? specSource.value : this.specSource,
    specConfidence: specConfidence.present
        ? specConfidence.value
        : this.specConfidence,
    weightLb: weightLb.present ? weightLb.value : this.weightLb,
    serial: serial.present ? serial.value : this.serial,
    imageLocalPath: imageLocalPath.present
        ? imageLocalPath.value
        : this.imageLocalPath,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    imageBase64: imageBase64.present ? imageBase64.value : this.imageBase64,
    deepCleanGames: deepCleanGames.present
        ? deepCleanGames.value
        : this.deepCleanGames,
    oilExtractGames: oilExtractGames.present
        ? oilExtractGames.value
        : this.oilExtractGames,
    resurfaceGames: resurfaceGames.present
        ? resurfaceGames.value
        : this.resurfaceGames,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Ball copyWithCompanion(BallsCompanion data) {
    return Ball(
      ballId: data.ballId.present ? data.ballId.value : this.ballId,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      coverstock: data.coverstock.present
          ? data.coverstock.value
          : this.coverstock,
      factoryFinish: data.factoryFinish.present
          ? data.factoryFinish.value
          : this.factoryFinish,
      rgFactory: data.rgFactory.present ? data.rgFactory.value : this.rgFactory,
      diffFactory: data.diffFactory.present
          ? data.diffFactory.value
          : this.diffFactory,
      rgAfter: data.rgAfter.present ? data.rgAfter.value : this.rgAfter,
      diffAfter: data.diffAfter.present ? data.diffAfter.value : this.diffAfter,
      papOver: data.papOver.present ? data.papOver.value : this.papOver,
      papUp: data.papUp.present ? data.papUp.value : this.papUp,
      papUnit: data.papUnit.present ? data.papUnit.value : this.papUnit,
      papHand: data.papHand.present ? data.papHand.value : this.papHand,
      specSource: data.specSource.present
          ? data.specSource.value
          : this.specSource,
      specConfidence: data.specConfidence.present
          ? data.specConfidence.value
          : this.specConfidence,
      weightLb: data.weightLb.present ? data.weightLb.value : this.weightLb,
      serial: data.serial.present ? data.serial.value : this.serial,
      imageLocalPath: data.imageLocalPath.present
          ? data.imageLocalPath.value
          : this.imageLocalPath,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      imageBase64: data.imageBase64.present
          ? data.imageBase64.value
          : this.imageBase64,
      deepCleanGames: data.deepCleanGames.present
          ? data.deepCleanGames.value
          : this.deepCleanGames,
      oilExtractGames: data.oilExtractGames.present
          ? data.oilExtractGames.value
          : this.oilExtractGames,
      resurfaceGames: data.resurfaceGames.present
          ? data.resurfaceGames.value
          : this.resurfaceGames,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ball(')
          ..write('ballId: $ballId, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('coverstock: $coverstock, ')
          ..write('factoryFinish: $factoryFinish, ')
          ..write('rgFactory: $rgFactory, ')
          ..write('diffFactory: $diffFactory, ')
          ..write('rgAfter: $rgAfter, ')
          ..write('diffAfter: $diffAfter, ')
          ..write('papOver: $papOver, ')
          ..write('papUp: $papUp, ')
          ..write('papUnit: $papUnit, ')
          ..write('papHand: $papHand, ')
          ..write('specSource: $specSource, ')
          ..write('specConfidence: $specConfidence, ')
          ..write('weightLb: $weightLb, ')
          ..write('serial: $serial, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('imageBase64: $imageBase64, ')
          ..write('deepCleanGames: $deepCleanGames, ')
          ..write('oilExtractGames: $oilExtractGames, ')
          ..write('resurfaceGames: $resurfaceGames, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    ballId,
    name,
    brand,
    coverstock,
    factoryFinish,
    rgFactory,
    diffFactory,
    rgAfter,
    diffAfter,
    papOver,
    papUp,
    papUnit,
    papHand,
    specSource,
    specConfidence,
    weightLb,
    serial,
    imageLocalPath,
    imageUrl,
    imageBase64,
    deepCleanGames,
    oilExtractGames,
    resurfaceGames,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ball &&
          other.ballId == this.ballId &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.coverstock == this.coverstock &&
          other.factoryFinish == this.factoryFinish &&
          other.rgFactory == this.rgFactory &&
          other.diffFactory == this.diffFactory &&
          other.rgAfter == this.rgAfter &&
          other.diffAfter == this.diffAfter &&
          other.papOver == this.papOver &&
          other.papUp == this.papUp &&
          other.papUnit == this.papUnit &&
          other.papHand == this.papHand &&
          other.specSource == this.specSource &&
          other.specConfidence == this.specConfidence &&
          other.weightLb == this.weightLb &&
          other.serial == this.serial &&
          other.imageLocalPath == this.imageLocalPath &&
          other.imageUrl == this.imageUrl &&
          other.imageBase64 == this.imageBase64 &&
          other.deepCleanGames == this.deepCleanGames &&
          other.oilExtractGames == this.oilExtractGames &&
          other.resurfaceGames == this.resurfaceGames &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BallsCompanion extends UpdateCompanion<Ball> {
  final Value<String> ballId;
  final Value<String> name;
  final Value<String?> brand;
  final Value<String?> coverstock;
  final Value<String?> factoryFinish;
  final Value<double?> rgFactory;
  final Value<double?> diffFactory;
  final Value<double?> rgAfter;
  final Value<double?> diffAfter;
  final Value<double?> papOver;
  final Value<double?> papUp;
  final Value<String> papUnit;
  final Value<String?> papHand;
  final Value<String?> specSource;
  final Value<double?> specConfidence;
  final Value<double?> weightLb;
  final Value<String?> serial;
  final Value<String?> imageLocalPath;
  final Value<String?> imageUrl;
  final Value<String?> imageBase64;
  final Value<int?> deepCleanGames;
  final Value<int?> oilExtractGames;
  final Value<int?> resurfaceGames;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const BallsCompanion({
    this.ballId = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.coverstock = const Value.absent(),
    this.factoryFinish = const Value.absent(),
    this.rgFactory = const Value.absent(),
    this.diffFactory = const Value.absent(),
    this.rgAfter = const Value.absent(),
    this.diffAfter = const Value.absent(),
    this.papOver = const Value.absent(),
    this.papUp = const Value.absent(),
    this.papUnit = const Value.absent(),
    this.papHand = const Value.absent(),
    this.specSource = const Value.absent(),
    this.specConfidence = const Value.absent(),
    this.weightLb = const Value.absent(),
    this.serial = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.imageBase64 = const Value.absent(),
    this.deepCleanGames = const Value.absent(),
    this.oilExtractGames = const Value.absent(),
    this.resurfaceGames = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BallsCompanion.insert({
    required String ballId,
    required String name,
    this.brand = const Value.absent(),
    this.coverstock = const Value.absent(),
    this.factoryFinish = const Value.absent(),
    this.rgFactory = const Value.absent(),
    this.diffFactory = const Value.absent(),
    this.rgAfter = const Value.absent(),
    this.diffAfter = const Value.absent(),
    this.papOver = const Value.absent(),
    this.papUp = const Value.absent(),
    this.papUnit = const Value.absent(),
    this.papHand = const Value.absent(),
    this.specSource = const Value.absent(),
    this.specConfidence = const Value.absent(),
    this.weightLb = const Value.absent(),
    this.serial = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.imageBase64 = const Value.absent(),
    this.deepCleanGames = const Value.absent(),
    this.oilExtractGames = const Value.absent(),
    this.resurfaceGames = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : ballId = Value(ballId),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Ball> custom({
    Expression<String>? ballId,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? coverstock,
    Expression<String>? factoryFinish,
    Expression<double>? rgFactory,
    Expression<double>? diffFactory,
    Expression<double>? rgAfter,
    Expression<double>? diffAfter,
    Expression<double>? papOver,
    Expression<double>? papUp,
    Expression<String>? papUnit,
    Expression<String>? papHand,
    Expression<String>? specSource,
    Expression<double>? specConfidence,
    Expression<double>? weightLb,
    Expression<String>? serial,
    Expression<String>? imageLocalPath,
    Expression<String>? imageUrl,
    Expression<String>? imageBase64,
    Expression<int>? deepCleanGames,
    Expression<int>? oilExtractGames,
    Expression<int>? resurfaceGames,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ballId != null) 'ball_id': ballId,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (coverstock != null) 'coverstock': coverstock,
      if (factoryFinish != null) 'factory_finish': factoryFinish,
      if (rgFactory != null) 'rg_factory': rgFactory,
      if (diffFactory != null) 'diff_factory': diffFactory,
      if (rgAfter != null) 'rg_after': rgAfter,
      if (diffAfter != null) 'diff_after': diffAfter,
      if (papOver != null) 'pap_over': papOver,
      if (papUp != null) 'pap_up': papUp,
      if (papUnit != null) 'pap_unit': papUnit,
      if (papHand != null) 'pap_hand': papHand,
      if (specSource != null) 'spec_source': specSource,
      if (specConfidence != null) 'spec_confidence': specConfidence,
      if (weightLb != null) 'weight_lb': weightLb,
      if (serial != null) 'serial': serial,
      if (imageLocalPath != null) 'image_local_path': imageLocalPath,
      if (imageUrl != null) 'image_url': imageUrl,
      if (imageBase64 != null) 'image_base64': imageBase64,
      if (deepCleanGames != null) 'deep_clean_games': deepCleanGames,
      if (oilExtractGames != null) 'oil_extract_games': oilExtractGames,
      if (resurfaceGames != null) 'resurface_games': resurfaceGames,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BallsCompanion copyWith({
    Value<String>? ballId,
    Value<String>? name,
    Value<String?>? brand,
    Value<String?>? coverstock,
    Value<String?>? factoryFinish,
    Value<double?>? rgFactory,
    Value<double?>? diffFactory,
    Value<double?>? rgAfter,
    Value<double?>? diffAfter,
    Value<double?>? papOver,
    Value<double?>? papUp,
    Value<String>? papUnit,
    Value<String?>? papHand,
    Value<String?>? specSource,
    Value<double?>? specConfidence,
    Value<double?>? weightLb,
    Value<String?>? serial,
    Value<String?>? imageLocalPath,
    Value<String?>? imageUrl,
    Value<String?>? imageBase64,
    Value<int?>? deepCleanGames,
    Value<int?>? oilExtractGames,
    Value<int?>? resurfaceGames,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return BallsCompanion(
      ballId: ballId ?? this.ballId,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      coverstock: coverstock ?? this.coverstock,
      factoryFinish: factoryFinish ?? this.factoryFinish,
      rgFactory: rgFactory ?? this.rgFactory,
      diffFactory: diffFactory ?? this.diffFactory,
      rgAfter: rgAfter ?? this.rgAfter,
      diffAfter: diffAfter ?? this.diffAfter,
      papOver: papOver ?? this.papOver,
      papUp: papUp ?? this.papUp,
      papUnit: papUnit ?? this.papUnit,
      papHand: papHand ?? this.papHand,
      specSource: specSource ?? this.specSource,
      specConfidence: specConfidence ?? this.specConfidence,
      weightLb: weightLb ?? this.weightLb,
      serial: serial ?? this.serial,
      imageLocalPath: imageLocalPath ?? this.imageLocalPath,
      imageUrl: imageUrl ?? this.imageUrl,
      imageBase64: imageBase64 ?? this.imageBase64,
      deepCleanGames: deepCleanGames ?? this.deepCleanGames,
      oilExtractGames: oilExtractGames ?? this.oilExtractGames,
      resurfaceGames: resurfaceGames ?? this.resurfaceGames,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ballId.present) {
      map['ball_id'] = Variable<String>(ballId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (coverstock.present) {
      map['coverstock'] = Variable<String>(coverstock.value);
    }
    if (factoryFinish.present) {
      map['factory_finish'] = Variable<String>(factoryFinish.value);
    }
    if (rgFactory.present) {
      map['rg_factory'] = Variable<double>(rgFactory.value);
    }
    if (diffFactory.present) {
      map['diff_factory'] = Variable<double>(diffFactory.value);
    }
    if (rgAfter.present) {
      map['rg_after'] = Variable<double>(rgAfter.value);
    }
    if (diffAfter.present) {
      map['diff_after'] = Variable<double>(diffAfter.value);
    }
    if (papOver.present) {
      map['pap_over'] = Variable<double>(papOver.value);
    }
    if (papUp.present) {
      map['pap_up'] = Variable<double>(papUp.value);
    }
    if (papUnit.present) {
      map['pap_unit'] = Variable<String>(papUnit.value);
    }
    if (papHand.present) {
      map['pap_hand'] = Variable<String>(papHand.value);
    }
    if (specSource.present) {
      map['spec_source'] = Variable<String>(specSource.value);
    }
    if (specConfidence.present) {
      map['spec_confidence'] = Variable<double>(specConfidence.value);
    }
    if (weightLb.present) {
      map['weight_lb'] = Variable<double>(weightLb.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (imageLocalPath.present) {
      map['image_local_path'] = Variable<String>(imageLocalPath.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (imageBase64.present) {
      map['image_base64'] = Variable<String>(imageBase64.value);
    }
    if (deepCleanGames.present) {
      map['deep_clean_games'] = Variable<int>(deepCleanGames.value);
    }
    if (oilExtractGames.present) {
      map['oil_extract_games'] = Variable<int>(oilExtractGames.value);
    }
    if (resurfaceGames.present) {
      map['resurface_games'] = Variable<int>(resurfaceGames.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BallsCompanion(')
          ..write('ballId: $ballId, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('coverstock: $coverstock, ')
          ..write('factoryFinish: $factoryFinish, ')
          ..write('rgFactory: $rgFactory, ')
          ..write('diffFactory: $diffFactory, ')
          ..write('rgAfter: $rgAfter, ')
          ..write('diffAfter: $diffAfter, ')
          ..write('papOver: $papOver, ')
          ..write('papUp: $papUp, ')
          ..write('papUnit: $papUnit, ')
          ..write('papHand: $papHand, ')
          ..write('specSource: $specSource, ')
          ..write('specConfidence: $specConfidence, ')
          ..write('weightLb: $weightLb, ')
          ..write('serial: $serial, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('imageBase64: $imageBase64, ')
          ..write('deepCleanGames: $deepCleanGames, ')
          ..write('oilExtractGames: $oilExtractGames, ')
          ..write('resurfaceGames: $resurfaceGames, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GameLogsTable extends GameLogs with TableInfo<$GameLogsTable, GameLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _logIdMeta = const VerificationMeta('logId');
  @override
  late final GeneratedColumn<String> logId = GeneratedColumn<String>(
    'log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ballIdMeta = const VerificationMeta('ballId');
  @override
  late final GeneratedColumn<String> ballId = GeneratedColumn<String>(
    'ball_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES balls (ball_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _centerMeta = const VerificationMeta('center');
  @override
  late final GeneratedColumn<String> center = GeneratedColumn<String>(
    'center',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gamesMeta = const VerificationMeta('games');
  @override
  late final GeneratedColumn<double> games = GeneratedColumn<double>(
    'games',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    logId,
    ballId,
    date,
    center,
    games,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('log_id')) {
      context.handle(
        _logIdMeta,
        logId.isAcceptableOrUnknown(data['log_id']!, _logIdMeta),
      );
    } else if (isInserting) {
      context.missing(_logIdMeta);
    }
    if (data.containsKey('ball_id')) {
      context.handle(
        _ballIdMeta,
        ballId.isAcceptableOrUnknown(data['ball_id']!, _ballIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ballIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('center')) {
      context.handle(
        _centerMeta,
        center.isAcceptableOrUnknown(data['center']!, _centerMeta),
      );
    }
    if (data.containsKey('games')) {
      context.handle(
        _gamesMeta,
        games.isAcceptableOrUnknown(data['games']!, _gamesMeta),
      );
    } else if (isInserting) {
      context.missing(_gamesMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {logId};
  @override
  GameLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameLog(
      logId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}log_id'],
      )!,
      ballId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ball_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      center: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}center'],
      ),
      games: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}games'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GameLogsTable createAlias(String alias) {
    return $GameLogsTable(attachedDatabase, alias);
  }
}

class GameLog extends DataClass implements Insertable<GameLog> {
  final String logId;
  final String ballId;
  final int date;
  final String? center;
  final double games;
  final String? notes;
  final int createdAt;
  const GameLog({
    required this.logId,
    required this.ballId,
    required this.date,
    this.center,
    required this.games,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['log_id'] = Variable<String>(logId);
    map['ball_id'] = Variable<String>(ballId);
    map['date'] = Variable<int>(date);
    if (!nullToAbsent || center != null) {
      map['center'] = Variable<String>(center);
    }
    map['games'] = Variable<double>(games);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  GameLogsCompanion toCompanion(bool nullToAbsent) {
    return GameLogsCompanion(
      logId: Value(logId),
      ballId: Value(ballId),
      date: Value(date),
      center: center == null && nullToAbsent
          ? const Value.absent()
          : Value(center),
      games: Value(games),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory GameLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameLog(
      logId: serializer.fromJson<String>(json['logId']),
      ballId: serializer.fromJson<String>(json['ballId']),
      date: serializer.fromJson<int>(json['date']),
      center: serializer.fromJson<String?>(json['center']),
      games: serializer.fromJson<double>(json['games']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'logId': serializer.toJson<String>(logId),
      'ballId': serializer.toJson<String>(ballId),
      'date': serializer.toJson<int>(date),
      'center': serializer.toJson<String?>(center),
      'games': serializer.toJson<double>(games),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  GameLog copyWith({
    String? logId,
    String? ballId,
    int? date,
    Value<String?> center = const Value.absent(),
    double? games,
    Value<String?> notes = const Value.absent(),
    int? createdAt,
  }) => GameLog(
    logId: logId ?? this.logId,
    ballId: ballId ?? this.ballId,
    date: date ?? this.date,
    center: center.present ? center.value : this.center,
    games: games ?? this.games,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  GameLog copyWithCompanion(GameLogsCompanion data) {
    return GameLog(
      logId: data.logId.present ? data.logId.value : this.logId,
      ballId: data.ballId.present ? data.ballId.value : this.ballId,
      date: data.date.present ? data.date.value : this.date,
      center: data.center.present ? data.center.value : this.center,
      games: data.games.present ? data.games.value : this.games,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameLog(')
          ..write('logId: $logId, ')
          ..write('ballId: $ballId, ')
          ..write('date: $date, ')
          ..write('center: $center, ')
          ..write('games: $games, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(logId, ballId, date, center, games, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameLog &&
          other.logId == this.logId &&
          other.ballId == this.ballId &&
          other.date == this.date &&
          other.center == this.center &&
          other.games == this.games &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class GameLogsCompanion extends UpdateCompanion<GameLog> {
  final Value<String> logId;
  final Value<String> ballId;
  final Value<int> date;
  final Value<String?> center;
  final Value<double> games;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const GameLogsCompanion({
    this.logId = const Value.absent(),
    this.ballId = const Value.absent(),
    this.date = const Value.absent(),
    this.center = const Value.absent(),
    this.games = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GameLogsCompanion.insert({
    required String logId,
    required String ballId,
    required int date,
    this.center = const Value.absent(),
    required double games,
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : logId = Value(logId),
       ballId = Value(ballId),
       date = Value(date),
       games = Value(games),
       createdAt = Value(createdAt);
  static Insertable<GameLog> custom({
    Expression<String>? logId,
    Expression<String>? ballId,
    Expression<int>? date,
    Expression<String>? center,
    Expression<double>? games,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (logId != null) 'log_id': logId,
      if (ballId != null) 'ball_id': ballId,
      if (date != null) 'date': date,
      if (center != null) 'center': center,
      if (games != null) 'games': games,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GameLogsCompanion copyWith({
    Value<String>? logId,
    Value<String>? ballId,
    Value<int>? date,
    Value<String?>? center,
    Value<double>? games,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return GameLogsCompanion(
      logId: logId ?? this.logId,
      ballId: ballId ?? this.ballId,
      date: date ?? this.date,
      center: center ?? this.center,
      games: games ?? this.games,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (logId.present) {
      map['log_id'] = Variable<String>(logId.value);
    }
    if (ballId.present) {
      map['ball_id'] = Variable<String>(ballId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (center.present) {
      map['center'] = Variable<String>(center.value);
    }
    if (games.present) {
      map['games'] = Variable<double>(games.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameLogsCompanion(')
          ..write('logId: $logId, ')
          ..write('ballId: $ballId, ')
          ..write('date: $date, ')
          ..write('center: $center, ')
          ..write('games: $games, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaintenanceRecordsTable extends MaintenanceRecords
    with TableInfo<$MaintenanceRecordsTable, MaintenanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaintenanceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _maintIdMeta = const VerificationMeta(
    'maintId',
  );
  @override
  late final GeneratedColumn<String> maintId = GeneratedColumn<String>(
    'maint_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ballIdMeta = const VerificationMeta('ballId');
  @override
  late final GeneratedColumn<String> ballId = GeneratedColumn<String>(
    'ball_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES balls (ball_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gritSequenceMeta = const VerificationMeta(
    'gritSequence',
  );
  @override
  late final GeneratedColumn<String> gritSequence = GeneratedColumn<String>(
    'grit_sequence',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    maintId,
    ballId,
    type,
    date,
    notes,
    gritSequence,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maintenance_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaintenanceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('maint_id')) {
      context.handle(
        _maintIdMeta,
        maintId.isAcceptableOrUnknown(data['maint_id']!, _maintIdMeta),
      );
    } else if (isInserting) {
      context.missing(_maintIdMeta);
    }
    if (data.containsKey('ball_id')) {
      context.handle(
        _ballIdMeta,
        ballId.isAcceptableOrUnknown(data['ball_id']!, _ballIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ballIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('grit_sequence')) {
      context.handle(
        _gritSequenceMeta,
        gritSequence.isAcceptableOrUnknown(
          data['grit_sequence']!,
          _gritSequenceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {maintId};
  @override
  MaintenanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaintenanceRecord(
      maintId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maint_id'],
      )!,
      ballId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ball_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      gritSequence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grit_sequence'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MaintenanceRecordsTable createAlias(String alias) {
    return $MaintenanceRecordsTable(attachedDatabase, alias);
  }
}

class MaintenanceRecord extends DataClass
    implements Insertable<MaintenanceRecord> {
  final String maintId;
  final String ballId;
  final String type;
  final int date;
  final String? notes;
  final String? gritSequence;
  final int createdAt;
  const MaintenanceRecord({
    required this.maintId,
    required this.ballId,
    required this.type,
    required this.date,
    this.notes,
    this.gritSequence,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['maint_id'] = Variable<String>(maintId);
    map['ball_id'] = Variable<String>(ballId);
    map['type'] = Variable<String>(type);
    map['date'] = Variable<int>(date);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || gritSequence != null) {
      map['grit_sequence'] = Variable<String>(gritSequence);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  MaintenanceRecordsCompanion toCompanion(bool nullToAbsent) {
    return MaintenanceRecordsCompanion(
      maintId: Value(maintId),
      ballId: Value(ballId),
      type: Value(type),
      date: Value(date),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      gritSequence: gritSequence == null && nullToAbsent
          ? const Value.absent()
          : Value(gritSequence),
      createdAt: Value(createdAt),
    );
  }

  factory MaintenanceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaintenanceRecord(
      maintId: serializer.fromJson<String>(json['maintId']),
      ballId: serializer.fromJson<String>(json['ballId']),
      type: serializer.fromJson<String>(json['type']),
      date: serializer.fromJson<int>(json['date']),
      notes: serializer.fromJson<String?>(json['notes']),
      gritSequence: serializer.fromJson<String?>(json['gritSequence']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'maintId': serializer.toJson<String>(maintId),
      'ballId': serializer.toJson<String>(ballId),
      'type': serializer.toJson<String>(type),
      'date': serializer.toJson<int>(date),
      'notes': serializer.toJson<String?>(notes),
      'gritSequence': serializer.toJson<String?>(gritSequence),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  MaintenanceRecord copyWith({
    String? maintId,
    String? ballId,
    String? type,
    int? date,
    Value<String?> notes = const Value.absent(),
    Value<String?> gritSequence = const Value.absent(),
    int? createdAt,
  }) => MaintenanceRecord(
    maintId: maintId ?? this.maintId,
    ballId: ballId ?? this.ballId,
    type: type ?? this.type,
    date: date ?? this.date,
    notes: notes.present ? notes.value : this.notes,
    gritSequence: gritSequence.present ? gritSequence.value : this.gritSequence,
    createdAt: createdAt ?? this.createdAt,
  );
  MaintenanceRecord copyWithCompanion(MaintenanceRecordsCompanion data) {
    return MaintenanceRecord(
      maintId: data.maintId.present ? data.maintId.value : this.maintId,
      ballId: data.ballId.present ? data.ballId.value : this.ballId,
      type: data.type.present ? data.type.value : this.type,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
      gritSequence: data.gritSequence.present
          ? data.gritSequence.value
          : this.gritSequence,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecord(')
          ..write('maintId: $maintId, ')
          ..write('ballId: $ballId, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('gritSequence: $gritSequence, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(maintId, ballId, type, date, notes, gritSequence, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaintenanceRecord &&
          other.maintId == this.maintId &&
          other.ballId == this.ballId &&
          other.type == this.type &&
          other.date == this.date &&
          other.notes == this.notes &&
          other.gritSequence == this.gritSequence &&
          other.createdAt == this.createdAt);
}

class MaintenanceRecordsCompanion extends UpdateCompanion<MaintenanceRecord> {
  final Value<String> maintId;
  final Value<String> ballId;
  final Value<String> type;
  final Value<int> date;
  final Value<String?> notes;
  final Value<String?> gritSequence;
  final Value<int> createdAt;
  final Value<int> rowid;
  const MaintenanceRecordsCompanion({
    this.maintId = const Value.absent(),
    this.ballId = const Value.absent(),
    this.type = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.gritSequence = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaintenanceRecordsCompanion.insert({
    required String maintId,
    required String ballId,
    required String type,
    required int date,
    this.notes = const Value.absent(),
    this.gritSequence = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : maintId = Value(maintId),
       ballId = Value(ballId),
       type = Value(type),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<MaintenanceRecord> custom({
    Expression<String>? maintId,
    Expression<String>? ballId,
    Expression<String>? type,
    Expression<int>? date,
    Expression<String>? notes,
    Expression<String>? gritSequence,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (maintId != null) 'maint_id': maintId,
      if (ballId != null) 'ball_id': ballId,
      if (type != null) 'type': type,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (gritSequence != null) 'grit_sequence': gritSequence,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaintenanceRecordsCompanion copyWith({
    Value<String>? maintId,
    Value<String>? ballId,
    Value<String>? type,
    Value<int>? date,
    Value<String?>? notes,
    Value<String?>? gritSequence,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return MaintenanceRecordsCompanion(
      maintId: maintId ?? this.maintId,
      ballId: ballId ?? this.ballId,
      type: type ?? this.type,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      gritSequence: gritSequence ?? this.gritSequence,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (maintId.present) {
      map['maint_id'] = Variable<String>(maintId.value);
    }
    if (ballId.present) {
      map['ball_id'] = Variable<String>(ballId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (gritSequence.present) {
      map['grit_sequence'] = Variable<String>(gritSequence.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecordsCompanion(')
          ..write('maintId: $maintId, ')
          ..write('ballId: $ballId, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('gritSequence: $gritSequence, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KvStoreTable extends KvStore with TableInfo<$KvStoreTable, KvStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KvStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kv_store';
  @override
  VerificationContext validateIntegrity(
    Insertable<KvStoreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  KvStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KvStoreData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $KvStoreTable createAlias(String alias) {
    return $KvStoreTable(attachedDatabase, alias);
  }
}

class KvStoreData extends DataClass implements Insertable<KvStoreData> {
  final String key;
  final String value;
  const KvStoreData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  KvStoreCompanion toCompanion(bool nullToAbsent) {
    return KvStoreCompanion(key: Value(key), value: Value(value));
  }

  factory KvStoreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KvStoreData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  KvStoreData copyWith({String? key, String? value}) =>
      KvStoreData(key: key ?? this.key, value: value ?? this.value);
  KvStoreData copyWithCompanion(KvStoreCompanion data) {
    return KvStoreData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KvStoreData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KvStoreData &&
          other.key == this.key &&
          other.value == this.value);
}

class KvStoreCompanion extends UpdateCompanion<KvStoreData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const KvStoreCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KvStoreCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<KvStoreData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KvStoreCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return KvStoreCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KvStoreCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BallsTable balls = $BallsTable(this);
  late final $GameLogsTable gameLogs = $GameLogsTable(this);
  late final $MaintenanceRecordsTable maintenanceRecords =
      $MaintenanceRecordsTable(this);
  late final $KvStoreTable kvStore = $KvStoreTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    balls,
    gameLogs,
    maintenanceRecords,
    kvStore,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'balls',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_logs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'balls',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('maintenance_records', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$BallsTableCreateCompanionBuilder =
    BallsCompanion Function({
      required String ballId,
      required String name,
      Value<String?> brand,
      Value<String?> coverstock,
      Value<String?> factoryFinish,
      Value<double?> rgFactory,
      Value<double?> diffFactory,
      Value<double?> rgAfter,
      Value<double?> diffAfter,
      Value<double?> papOver,
      Value<double?> papUp,
      Value<String> papUnit,
      Value<String?> papHand,
      Value<String?> specSource,
      Value<double?> specConfidence,
      Value<double?> weightLb,
      Value<String?> serial,
      Value<String?> imageLocalPath,
      Value<String?> imageUrl,
      Value<String?> imageBase64,
      Value<int?> deepCleanGames,
      Value<int?> oilExtractGames,
      Value<int?> resurfaceGames,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$BallsTableUpdateCompanionBuilder =
    BallsCompanion Function({
      Value<String> ballId,
      Value<String> name,
      Value<String?> brand,
      Value<String?> coverstock,
      Value<String?> factoryFinish,
      Value<double?> rgFactory,
      Value<double?> diffFactory,
      Value<double?> rgAfter,
      Value<double?> diffAfter,
      Value<double?> papOver,
      Value<double?> papUp,
      Value<String> papUnit,
      Value<String?> papHand,
      Value<String?> specSource,
      Value<double?> specConfidence,
      Value<double?> weightLb,
      Value<String?> serial,
      Value<String?> imageLocalPath,
      Value<String?> imageUrl,
      Value<String?> imageBase64,
      Value<int?> deepCleanGames,
      Value<int?> oilExtractGames,
      Value<int?> resurfaceGames,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$BallsTableReferences
    extends BaseReferences<_$AppDatabase, $BallsTable, Ball> {
  $$BallsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GameLogsTable, List<GameLog>> _gameLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.gameLogs,
    aliasName: $_aliasNameGenerator(db.balls.ballId, db.gameLogs.ballId),
  );

  $$GameLogsTableProcessedTableManager get gameLogsRefs {
    final manager = $$GameLogsTableTableManager($_db, $_db.gameLogs).filter(
      (f) => f.ballId.ballId.sqlEquals($_itemColumn<String>('ball_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_gameLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MaintenanceRecordsTable, List<MaintenanceRecord>>
  _maintenanceRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.maintenanceRecords,
        aliasName: $_aliasNameGenerator(
          db.balls.ballId,
          db.maintenanceRecords.ballId,
        ),
      );

  $$MaintenanceRecordsTableProcessedTableManager get maintenanceRecordsRefs {
    final manager =
        $$MaintenanceRecordsTableTableManager(
          $_db,
          $_db.maintenanceRecords,
        ).filter(
          (f) => f.ballId.ballId.sqlEquals($_itemColumn<String>('ball_id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _maintenanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BallsTableFilterComposer extends Composer<_$AppDatabase, $BallsTable> {
  $$BallsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get ballId => $composableBuilder(
    column: $table.ballId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverstock => $composableBuilder(
    column: $table.coverstock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get factoryFinish => $composableBuilder(
    column: $table.factoryFinish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rgFactory => $composableBuilder(
    column: $table.rgFactory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diffFactory => $composableBuilder(
    column: $table.diffFactory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rgAfter => $composableBuilder(
    column: $table.rgAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diffAfter => $composableBuilder(
    column: $table.diffAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get papOver => $composableBuilder(
    column: $table.papOver,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get papUp => $composableBuilder(
    column: $table.papUp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get papUnit => $composableBuilder(
    column: $table.papUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get papHand => $composableBuilder(
    column: $table.papHand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specSource => $composableBuilder(
    column: $table.specSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get specConfidence => $composableBuilder(
    column: $table.specConfidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightLb => $composableBuilder(
    column: $table.weightLb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageBase64 => $composableBuilder(
    column: $table.imageBase64,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deepCleanGames => $composableBuilder(
    column: $table.deepCleanGames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get oilExtractGames => $composableBuilder(
    column: $table.oilExtractGames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get resurfaceGames => $composableBuilder(
    column: $table.resurfaceGames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> gameLogsRefs(
    Expression<bool> Function($$GameLogsTableFilterComposer f) f,
  ) {
    final $$GameLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.gameLogs,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameLogsTableFilterComposer(
            $db: $db,
            $table: $db.gameLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> maintenanceRecordsRefs(
    Expression<bool> Function($$MaintenanceRecordsTableFilterComposer f) f,
  ) {
    final $$MaintenanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.maintenanceRecords,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MaintenanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.maintenanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BallsTableOrderingComposer
    extends Composer<_$AppDatabase, $BallsTable> {
  $$BallsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get ballId => $composableBuilder(
    column: $table.ballId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverstock => $composableBuilder(
    column: $table.coverstock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get factoryFinish => $composableBuilder(
    column: $table.factoryFinish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rgFactory => $composableBuilder(
    column: $table.rgFactory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diffFactory => $composableBuilder(
    column: $table.diffFactory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rgAfter => $composableBuilder(
    column: $table.rgAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diffAfter => $composableBuilder(
    column: $table.diffAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get papOver => $composableBuilder(
    column: $table.papOver,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get papUp => $composableBuilder(
    column: $table.papUp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get papUnit => $composableBuilder(
    column: $table.papUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get papHand => $composableBuilder(
    column: $table.papHand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specSource => $composableBuilder(
    column: $table.specSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get specConfidence => $composableBuilder(
    column: $table.specConfidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightLb => $composableBuilder(
    column: $table.weightLb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageBase64 => $composableBuilder(
    column: $table.imageBase64,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deepCleanGames => $composableBuilder(
    column: $table.deepCleanGames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get oilExtractGames => $composableBuilder(
    column: $table.oilExtractGames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get resurfaceGames => $composableBuilder(
    column: $table.resurfaceGames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BallsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BallsTable> {
  $$BallsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get ballId =>
      $composableBuilder(column: $table.ballId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get coverstock => $composableBuilder(
    column: $table.coverstock,
    builder: (column) => column,
  );

  GeneratedColumn<String> get factoryFinish => $composableBuilder(
    column: $table.factoryFinish,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rgFactory =>
      $composableBuilder(column: $table.rgFactory, builder: (column) => column);

  GeneratedColumn<double> get diffFactory => $composableBuilder(
    column: $table.diffFactory,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rgAfter =>
      $composableBuilder(column: $table.rgAfter, builder: (column) => column);

  GeneratedColumn<double> get diffAfter =>
      $composableBuilder(column: $table.diffAfter, builder: (column) => column);

  GeneratedColumn<double> get papOver =>
      $composableBuilder(column: $table.papOver, builder: (column) => column);

  GeneratedColumn<double> get papUp =>
      $composableBuilder(column: $table.papUp, builder: (column) => column);

  GeneratedColumn<String> get papUnit =>
      $composableBuilder(column: $table.papUnit, builder: (column) => column);

  GeneratedColumn<String> get papHand =>
      $composableBuilder(column: $table.papHand, builder: (column) => column);

  GeneratedColumn<String> get specSource => $composableBuilder(
    column: $table.specSource,
    builder: (column) => column,
  );

  GeneratedColumn<double> get specConfidence => $composableBuilder(
    column: $table.specConfidence,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightLb =>
      $composableBuilder(column: $table.weightLb, builder: (column) => column);

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get imageBase64 => $composableBuilder(
    column: $table.imageBase64,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deepCleanGames => $composableBuilder(
    column: $table.deepCleanGames,
    builder: (column) => column,
  );

  GeneratedColumn<int> get oilExtractGames => $composableBuilder(
    column: $table.oilExtractGames,
    builder: (column) => column,
  );

  GeneratedColumn<int> get resurfaceGames => $composableBuilder(
    column: $table.resurfaceGames,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> gameLogsRefs<T extends Object>(
    Expression<T> Function($$GameLogsTableAnnotationComposer a) f,
  ) {
    final $$GameLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.gameLogs,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> maintenanceRecordsRefs<T extends Object>(
    Expression<T> Function($$MaintenanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$MaintenanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.ballId,
          referencedTable: $db.maintenanceRecords,
          getReferencedColumn: (t) => t.ballId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MaintenanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.maintenanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BallsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BallsTable,
          Ball,
          $$BallsTableFilterComposer,
          $$BallsTableOrderingComposer,
          $$BallsTableAnnotationComposer,
          $$BallsTableCreateCompanionBuilder,
          $$BallsTableUpdateCompanionBuilder,
          (Ball, $$BallsTableReferences),
          Ball,
          PrefetchHooks Function({
            bool gameLogsRefs,
            bool maintenanceRecordsRefs,
          })
        > {
  $$BallsTableTableManager(_$AppDatabase db, $BallsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BallsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BallsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BallsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> ballId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> coverstock = const Value.absent(),
                Value<String?> factoryFinish = const Value.absent(),
                Value<double?> rgFactory = const Value.absent(),
                Value<double?> diffFactory = const Value.absent(),
                Value<double?> rgAfter = const Value.absent(),
                Value<double?> diffAfter = const Value.absent(),
                Value<double?> papOver = const Value.absent(),
                Value<double?> papUp = const Value.absent(),
                Value<String> papUnit = const Value.absent(),
                Value<String?> papHand = const Value.absent(),
                Value<String?> specSource = const Value.absent(),
                Value<double?> specConfidence = const Value.absent(),
                Value<double?> weightLb = const Value.absent(),
                Value<String?> serial = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> imageBase64 = const Value.absent(),
                Value<int?> deepCleanGames = const Value.absent(),
                Value<int?> oilExtractGames = const Value.absent(),
                Value<int?> resurfaceGames = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BallsCompanion(
                ballId: ballId,
                name: name,
                brand: brand,
                coverstock: coverstock,
                factoryFinish: factoryFinish,
                rgFactory: rgFactory,
                diffFactory: diffFactory,
                rgAfter: rgAfter,
                diffAfter: diffAfter,
                papOver: papOver,
                papUp: papUp,
                papUnit: papUnit,
                papHand: papHand,
                specSource: specSource,
                specConfidence: specConfidence,
                weightLb: weightLb,
                serial: serial,
                imageLocalPath: imageLocalPath,
                imageUrl: imageUrl,
                imageBase64: imageBase64,
                deepCleanGames: deepCleanGames,
                oilExtractGames: oilExtractGames,
                resurfaceGames: resurfaceGames,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ballId,
                required String name,
                Value<String?> brand = const Value.absent(),
                Value<String?> coverstock = const Value.absent(),
                Value<String?> factoryFinish = const Value.absent(),
                Value<double?> rgFactory = const Value.absent(),
                Value<double?> diffFactory = const Value.absent(),
                Value<double?> rgAfter = const Value.absent(),
                Value<double?> diffAfter = const Value.absent(),
                Value<double?> papOver = const Value.absent(),
                Value<double?> papUp = const Value.absent(),
                Value<String> papUnit = const Value.absent(),
                Value<String?> papHand = const Value.absent(),
                Value<String?> specSource = const Value.absent(),
                Value<double?> specConfidence = const Value.absent(),
                Value<double?> weightLb = const Value.absent(),
                Value<String?> serial = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> imageBase64 = const Value.absent(),
                Value<int?> deepCleanGames = const Value.absent(),
                Value<int?> oilExtractGames = const Value.absent(),
                Value<int?> resurfaceGames = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => BallsCompanion.insert(
                ballId: ballId,
                name: name,
                brand: brand,
                coverstock: coverstock,
                factoryFinish: factoryFinish,
                rgFactory: rgFactory,
                diffFactory: diffFactory,
                rgAfter: rgAfter,
                diffAfter: diffAfter,
                papOver: papOver,
                papUp: papUp,
                papUnit: papUnit,
                papHand: papHand,
                specSource: specSource,
                specConfidence: specConfidence,
                weightLb: weightLb,
                serial: serial,
                imageLocalPath: imageLocalPath,
                imageUrl: imageUrl,
                imageBase64: imageBase64,
                deepCleanGames: deepCleanGames,
                oilExtractGames: oilExtractGames,
                resurfaceGames: resurfaceGames,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BallsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({gameLogsRefs = false, maintenanceRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (gameLogsRefs) db.gameLogs,
                    if (maintenanceRecordsRefs) db.maintenanceRecords,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (gameLogsRefs)
                        await $_getPrefetchedData<Ball, $BallsTable, GameLog>(
                          currentTable: table,
                          referencedTable: $$BallsTableReferences
                              ._gameLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BallsTableReferences(
                                db,
                                table,
                                p0,
                              ).gameLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ballId == item.ballId,
                              ),
                          typedResults: items,
                        ),
                      if (maintenanceRecordsRefs)
                        await $_getPrefetchedData<
                          Ball,
                          $BallsTable,
                          MaintenanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$BallsTableReferences
                              ._maintenanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BallsTableReferences(
                                db,
                                table,
                                p0,
                              ).maintenanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ballId == item.ballId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BallsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BallsTable,
      Ball,
      $$BallsTableFilterComposer,
      $$BallsTableOrderingComposer,
      $$BallsTableAnnotationComposer,
      $$BallsTableCreateCompanionBuilder,
      $$BallsTableUpdateCompanionBuilder,
      (Ball, $$BallsTableReferences),
      Ball,
      PrefetchHooks Function({bool gameLogsRefs, bool maintenanceRecordsRefs})
    >;
typedef $$GameLogsTableCreateCompanionBuilder =
    GameLogsCompanion Function({
      required String logId,
      required String ballId,
      required int date,
      Value<String?> center,
      required double games,
      Value<String?> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$GameLogsTableUpdateCompanionBuilder =
    GameLogsCompanion Function({
      Value<String> logId,
      Value<String> ballId,
      Value<int> date,
      Value<String?> center,
      Value<double> games,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$GameLogsTableReferences
    extends BaseReferences<_$AppDatabase, $GameLogsTable, GameLog> {
  $$GameLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BallsTable _ballIdTable(_$AppDatabase db) => db.balls.createAlias(
    $_aliasNameGenerator(db.gameLogs.ballId, db.balls.ballId),
  );

  $$BallsTableProcessedTableManager get ballId {
    final $_column = $_itemColumn<String>('ball_id')!;

    final manager = $$BallsTableTableManager(
      $_db,
      $_db.balls,
    ).filter((f) => f.ballId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ballIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GameLogsTableFilterComposer
    extends Composer<_$AppDatabase, $GameLogsTable> {
  $$GameLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get logId => $composableBuilder(
    column: $table.logId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get center => $composableBuilder(
    column: $table.center,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get games => $composableBuilder(
    column: $table.games,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BallsTableFilterComposer get ballId {
    final $$BallsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.balls,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BallsTableFilterComposer(
            $db: $db,
            $table: $db.balls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameLogsTable> {
  $$GameLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get logId => $composableBuilder(
    column: $table.logId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get center => $composableBuilder(
    column: $table.center,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get games => $composableBuilder(
    column: $table.games,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BallsTableOrderingComposer get ballId {
    final $$BallsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.balls,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BallsTableOrderingComposer(
            $db: $db,
            $table: $db.balls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameLogsTable> {
  $$GameLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get logId =>
      $composableBuilder(column: $table.logId, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get center =>
      $composableBuilder(column: $table.center, builder: (column) => column);

  GeneratedColumn<double> get games =>
      $composableBuilder(column: $table.games, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BallsTableAnnotationComposer get ballId {
    final $$BallsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.balls,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BallsTableAnnotationComposer(
            $db: $db,
            $table: $db.balls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameLogsTable,
          GameLog,
          $$GameLogsTableFilterComposer,
          $$GameLogsTableOrderingComposer,
          $$GameLogsTableAnnotationComposer,
          $$GameLogsTableCreateCompanionBuilder,
          $$GameLogsTableUpdateCompanionBuilder,
          (GameLog, $$GameLogsTableReferences),
          GameLog,
          PrefetchHooks Function({bool ballId})
        > {
  $$GameLogsTableTableManager(_$AppDatabase db, $GameLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> logId = const Value.absent(),
                Value<String> ballId = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String?> center = const Value.absent(),
                Value<double> games = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GameLogsCompanion(
                logId: logId,
                ballId: ballId,
                date: date,
                center: center,
                games: games,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String logId,
                required String ballId,
                required int date,
                Value<String?> center = const Value.absent(),
                required double games,
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => GameLogsCompanion.insert(
                logId: logId,
                ballId: ballId,
                date: date,
                center: center,
                games: games,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ballId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ballId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ballId,
                                referencedTable: $$GameLogsTableReferences
                                    ._ballIdTable(db),
                                referencedColumn: $$GameLogsTableReferences
                                    ._ballIdTable(db)
                                    .ballId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GameLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameLogsTable,
      GameLog,
      $$GameLogsTableFilterComposer,
      $$GameLogsTableOrderingComposer,
      $$GameLogsTableAnnotationComposer,
      $$GameLogsTableCreateCompanionBuilder,
      $$GameLogsTableUpdateCompanionBuilder,
      (GameLog, $$GameLogsTableReferences),
      GameLog,
      PrefetchHooks Function({bool ballId})
    >;
typedef $$MaintenanceRecordsTableCreateCompanionBuilder =
    MaintenanceRecordsCompanion Function({
      required String maintId,
      required String ballId,
      required String type,
      required int date,
      Value<String?> notes,
      Value<String?> gritSequence,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$MaintenanceRecordsTableUpdateCompanionBuilder =
    MaintenanceRecordsCompanion Function({
      Value<String> maintId,
      Value<String> ballId,
      Value<String> type,
      Value<int> date,
      Value<String?> notes,
      Value<String?> gritSequence,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$MaintenanceRecordsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MaintenanceRecordsTable,
          MaintenanceRecord
        > {
  $$MaintenanceRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BallsTable _ballIdTable(_$AppDatabase db) => db.balls.createAlias(
    $_aliasNameGenerator(db.maintenanceRecords.ballId, db.balls.ballId),
  );

  $$BallsTableProcessedTableManager get ballId {
    final $_column = $_itemColumn<String>('ball_id')!;

    final manager = $$BallsTableTableManager(
      $_db,
      $_db.balls,
    ).filter((f) => f.ballId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ballIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MaintenanceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get maintId => $composableBuilder(
    column: $table.maintId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gritSequence => $composableBuilder(
    column: $table.gritSequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BallsTableFilterComposer get ballId {
    final $$BallsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.balls,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BallsTableFilterComposer(
            $db: $db,
            $table: $db.balls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get maintId => $composableBuilder(
    column: $table.maintId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gritSequence => $composableBuilder(
    column: $table.gritSequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BallsTableOrderingComposer get ballId {
    final $$BallsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.balls,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BallsTableOrderingComposer(
            $db: $db,
            $table: $db.balls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get maintId =>
      $composableBuilder(column: $table.maintId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get gritSequence => $composableBuilder(
    column: $table.gritSequence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BallsTableAnnotationComposer get ballId {
    final $$BallsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ballId,
      referencedTable: $db.balls,
      getReferencedColumn: (t) => t.ballId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BallsTableAnnotationComposer(
            $db: $db,
            $table: $db.balls,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MaintenanceRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MaintenanceRecordsTable,
          MaintenanceRecord,
          $$MaintenanceRecordsTableFilterComposer,
          $$MaintenanceRecordsTableOrderingComposer,
          $$MaintenanceRecordsTableAnnotationComposer,
          $$MaintenanceRecordsTableCreateCompanionBuilder,
          $$MaintenanceRecordsTableUpdateCompanionBuilder,
          (MaintenanceRecord, $$MaintenanceRecordsTableReferences),
          MaintenanceRecord,
          PrefetchHooks Function({bool ballId})
        > {
  $$MaintenanceRecordsTableTableManager(
    _$AppDatabase db,
    $MaintenanceRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaintenanceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaintenanceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaintenanceRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> maintId = const Value.absent(),
                Value<String> ballId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> gritSequence = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaintenanceRecordsCompanion(
                maintId: maintId,
                ballId: ballId,
                type: type,
                date: date,
                notes: notes,
                gritSequence: gritSequence,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String maintId,
                required String ballId,
                required String type,
                required int date,
                Value<String?> notes = const Value.absent(),
                Value<String?> gritSequence = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MaintenanceRecordsCompanion.insert(
                maintId: maintId,
                ballId: ballId,
                type: type,
                date: date,
                notes: notes,
                gritSequence: gritSequence,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MaintenanceRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ballId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ballId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ballId,
                                referencedTable:
                                    $$MaintenanceRecordsTableReferences
                                        ._ballIdTable(db),
                                referencedColumn:
                                    $$MaintenanceRecordsTableReferences
                                        ._ballIdTable(db)
                                        .ballId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MaintenanceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MaintenanceRecordsTable,
      MaintenanceRecord,
      $$MaintenanceRecordsTableFilterComposer,
      $$MaintenanceRecordsTableOrderingComposer,
      $$MaintenanceRecordsTableAnnotationComposer,
      $$MaintenanceRecordsTableCreateCompanionBuilder,
      $$MaintenanceRecordsTableUpdateCompanionBuilder,
      (MaintenanceRecord, $$MaintenanceRecordsTableReferences),
      MaintenanceRecord,
      PrefetchHooks Function({bool ballId})
    >;
typedef $$KvStoreTableCreateCompanionBuilder =
    KvStoreCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$KvStoreTableUpdateCompanionBuilder =
    KvStoreCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$KvStoreTableFilterComposer
    extends Composer<_$AppDatabase, $KvStoreTable> {
  $$KvStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KvStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $KvStoreTable> {
  $$KvStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KvStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $KvStoreTable> {
  $$KvStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$KvStoreTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KvStoreTable,
          KvStoreData,
          $$KvStoreTableFilterComposer,
          $$KvStoreTableOrderingComposer,
          $$KvStoreTableAnnotationComposer,
          $$KvStoreTableCreateCompanionBuilder,
          $$KvStoreTableUpdateCompanionBuilder,
          (
            KvStoreData,
            BaseReferences<_$AppDatabase, $KvStoreTable, KvStoreData>,
          ),
          KvStoreData,
          PrefetchHooks Function()
        > {
  $$KvStoreTableTableManager(_$AppDatabase db, $KvStoreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KvStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KvStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KvStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KvStoreCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) =>
                  KvStoreCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KvStoreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KvStoreTable,
      KvStoreData,
      $$KvStoreTableFilterComposer,
      $$KvStoreTableOrderingComposer,
      $$KvStoreTableAnnotationComposer,
      $$KvStoreTableCreateCompanionBuilder,
      $$KvStoreTableUpdateCompanionBuilder,
      (KvStoreData, BaseReferences<_$AppDatabase, $KvStoreTable, KvStoreData>),
      KvStoreData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BallsTableTableManager get balls =>
      $$BallsTableTableManager(_db, _db.balls);
  $$GameLogsTableTableManager get gameLogs =>
      $$GameLogsTableTableManager(_db, _db.gameLogs);
  $$MaintenanceRecordsTableTableManager get maintenanceRecords =>
      $$MaintenanceRecordsTableTableManager(_db, _db.maintenanceRecords);
  $$KvStoreTableTableManager get kvStore =>
      $$KvStoreTableTableManager(_db, _db.kvStore);
}
