// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectBean _$ProjectBeanFromJson(Map<String, dynamic> json) => ProjectBean()
  ..version = json['version'] as int
  ..file_id = json['file_id'] as String?
  ..file_name = json['file_name'] as String?
  ..create_time = json['create_time'] as int?
  ..update_time = json['update_time'] as int?
  ..platform = json['platform'] as String?
  ..width = (json['width'] as num?)?.toDouble()
  ..height = (json['height'] as num?)?.toDouble()
  ..preview_img = json['preview_img'] as String?
  ..swVersion = json['swVersion'] as int?
  ..hwVersion = json['hwVersion'] as int?
  ..productName = json['productName'] as String?
  ..exDevice = json['exDevice'] as String?
  ..moduleState = json['moduleState'] as int?
  ..laserOptions = json['laserOptions'] as String?
  ..data = json['data'] as String?
  ..laserOptionsList = (json['laserOptionsList'] as List<dynamic>?)
      ?.map((e) => LaserOptionsBean.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProjectBeanToJson(ProjectBean instance) =>
    <String, dynamic>{
      'version': instance.version,
      'file_id': instance.file_id,
      'file_name': instance.file_name,
      'create_time': instance.create_time,
      'update_time': instance.update_time,
      'platform': instance.platform,
      'width': instance.width,
      'height': instance.height,
      'preview_img': instance.preview_img,
      'swVersion': instance.swVersion,
      'hwVersion': instance.hwVersion,
      'productName': instance.productName,
      'exDevice': instance.exDevice,
      'moduleState': instance.moduleState,
      'laserOptions': instance.laserOptions,
      'data': instance.data,
      'laserOptionsList': instance.laserOptionsList,
    };
