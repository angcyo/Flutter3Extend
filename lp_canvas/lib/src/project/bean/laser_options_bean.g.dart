// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laser_options_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaserOptionsBean _$LaserOptionsBeanFromJson(Map<String, dynamic> json) =>
    LaserOptionsBean()
      ..layerId = json['layerId'] as String?
      ..version = json['version'] as int
      ..diameter = (json['diameter'] as num?)?.toDouble()
      ..lightSource = json['lightSource'] as int?
      ..precision = json['precision'] as int?
      ..printCount = json['printCount'] as int?
      ..printDepth = json['printDepth'] as int?
      ..printPower = json['printPower'] as int?
      ..dpi = (json['dpi'] as num?)?.toDouble()
      ..pump = json['pump'] as int?
      ..materialCode = json['materialCode'] as String?
      ..materialId = json['materialId'] as String?
      ..materialKey = json['materialKey'] as String?
      ..materialName = json['materialName'] as String?;

Map<String, dynamic> _$LaserOptionsBeanToJson(LaserOptionsBean instance) =>
    <String, dynamic>{
      'layerId': instance.layerId,
      'version': instance.version,
      'diameter': instance.diameter,
      'lightSource': instance.lightSource,
      'precision': instance.precision,
      'printCount': instance.printCount,
      'printDepth': instance.printDepth,
      'printPower': instance.printPower,
      'dpi': instance.dpi,
      'pump': instance.pump,
      'materialCode': instance.materialCode,
      'materialId': instance.materialId,
      'materialKey': instance.materialKey,
      'materialName': instance.materialName,
    };
