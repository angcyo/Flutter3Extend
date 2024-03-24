import 'package:flutter3_app/flutter3_app.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lp_canvas/src/project/bean/laser_options_bean.dart';

part 'project_bean.g.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///
/// 工程数据结构, 存在在`zip`包文件`.lp2`中的`.lpproject`实体中
/// https://www.showdoc.com.cn/2057569273029235/9276420919604941
@JsonSerializable()
class ProjectBean {
  factory ProjectBean.fromJson(Map<String, dynamic> json) =>
      _$ProjectBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectBeanToJson(this);

  ProjectBean();

  //region ---工程基础描述---

  /// 工程数据结构的版本, 这里固定为2
  int version = 2;

  /// 工程文件的id
  String? file_id;

  /// 工程名称
  String? file_name;

  /// 工程的创建时间
  int? create_time;

  /// 工程的更新时间
  int? update_time;

  /// 对应平台的描述信息
  /// `Android 5366`
  String? platform;

  //---

  /// 工程所有元素占用的宽度, 毫米
  @mm
  double? width;
  double? height;

  /// 工程的预览图, base64带协议的图片数据
  @Deprecated('v2版本的数据结构中, 预览图放在zip文件根目录的preview.png实体中')
  String? preview_img;

  //endregion ---工程基础描述---

  //region ---设备相关描述---

  /// 设备的固件版本号
  int? swVersion;

  /// 设备的硬件版本号
  int? hwVersion;

  /// 当前的产品名, LP4/LX1
  String? productName;

  /// 当前的外设, z/s/r/car
  String? exDevice;

  /// LX1当前的工作模块
  int? moduleState;

  //endregion ---设备相关描述---

  //region ---雕刻相关---

  /// [各个图层对应的雕刻参数]
  /// JSONString (Array对应的json字符串) 镭雕参数
  /// [LaserOptionsBean]
  String? laserOptions;

  //endregion ---雕刻相关---

  /// 所有元素集合
  /// JSONString (Array对应的json字符串) 元素集合
  String? data;

  //region ---方法---

  List<LaserOptionsBean>? get laserOptionsList {
    if (laserOptions == null) {
      return null;
    }
    final list = <LaserOptionsBean>[];
    final jsonList = laserOptions.fromJson();
    for (final json in jsonList) {
      list.add(LaserOptionsBean.fromJson(json));
    }
    return list;
  }

  set laserOptionsList(List<LaserOptionsBean>? list) {
    if (list == null) {
      laserOptions = null;
    } else {
      final jsonList = <Map<String, dynamic>>[];
      for (final bean in list) {
        jsonList.add(bean.toJson());
      }
      laserOptions = jsonList.toJsonString();
    }
  }

//endregion ---方法---
}
