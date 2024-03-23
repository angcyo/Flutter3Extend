part of '../../../lp_canvas.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///
/// 雕刻参数数据结构
class LaserOptionsBean {
  /// layerFill:填充图层；
  /// layerPicture：图片图层；
  /// layerLine：线条图层；
  /// layerCut：切割图层
  /// [LpHelper.layerFill]
  /// [LpHelper.layerPicture]
  /// [LpHelper.layerLine]
  /// [LpHelper.layerCut]
  String? layerId;

  /// 数据的版本
  int version = 1;

  /// 旋转轴直径,毫米
  @mm
  double? diameter;

  //---

  /// 白光: 1为1064nm激光，
  /// 蓝光: 0为450nm激光。
  /// [LpHelper.blueLight]
  /// [LpHelper.whiteLight]
  ///
  int? lightSource;

  /// 加速度
  int? precision;

  /// 雕刻次数
  int? printCount;

  /// 深度
  int? printDepth;

  /// 功率
  int? printPower;

  /// 分辨率 254 512
  double? dpi;

  /// [0~255] 气泵等级/风速等级 2023-12-12
  int? pump;

  //---

  /// 材质: 唯一ID
  String? materialCode;

  /// 材质id, 用来查询是哪一种材质
  /// 相同材质下, 有不同的参数信息
  String? materialId;

  /// 材质资源key, 用来国际化
  String? materialKey;

  /// 材质名称, 用来限制自定义的材质名称
  String? materialName;

  //region ---方法---

  ///fromJson
  LaserOptionsBean.fromJson(dynamic json) {
    layerId = json['layerId'];
    version = json['version'];
    diameter = json['diameter'];
    lightSource = json['lightSource'];
    precision = json['precision'];
    printCount = json['printCount'];
    printDepth = json['printDepth'];
    printPower = json['printPower'];
    dpi = json['dpi'];
    pump = json['pump'];
    materialCode = json['materialCode'];
    materialId = json['materialId'];
    materialKey = json['materialKey'];
    materialName = json['materialName'];
  }

  ///toJson
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['layerId'] = layerId;
    map['version'] = version;
    map['diameter'] = diameter;
    map['lightSource'] = lightSource;
    map['precision'] = precision;
    map['printCount'] = printCount;
    map['printDepth'] = printDepth;
    map['printPower'] = printPower;
    map['dpi'] = dpi;
    map['pump'] = pump;
    map['materialCode'] = materialCode;
    map['materialId'] = materialId;
    map['materialKey'] = materialKey;
    map['materialName'] = materialName;
    return map;
  }

//endregion ---方法---
}
