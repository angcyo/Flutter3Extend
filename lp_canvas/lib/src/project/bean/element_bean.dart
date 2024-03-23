part of '../../../lp_canvas.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///
/// 描述元素的数据结构
class ElementBean {
  //region ---bounds---

  /// 数据所在位置
  @mm
  double? left;

  @mm
  double? top;

  /// 数据原始的宽高; 线条的长度
  /// 如果是图片元素; 则存储的就是图片宽高
  @mm
  double? width;

  @mm
  double? height;

  /// 旋转的度数; 角度单位
  double? angle;

  /// 数据绘制时的缩放比例
  double? scaleX;
  double? scaleY;

  /// 是否水平翻转
  bool flipX = false;

  /// 是否垂直翻转
  bool flipY = false;

  /// 数据绘制时的倾斜度数; 角度单位
  double? skewX;
  double? skewY;

  //endregion ---bounds---

  //region ---公共属性---

  /// 数据id
  int id = -1;

  /// 数据唯一标识符
  String? uuid = uuid_;

  /// 图层代表图标; 如果有base64协议图片
  String? icon;

  /// 数据类型; 线条类型的长度放在[width]属性中
  /// [com.angcyo.laserpacker.LPDataConstant.DATA_TYPE_TEXT]
  /// [com.angcyo.laserpacker.LPDataConstant.DATA_TYPE_RECT]
  /// [com.angcyo.laserpacker.LPDataConstant.DATA_TYPE_OVAL]
  /// [com.angcyo.laserpacker.LPDataConstant.DATA_TYPE_LINE]
  /// [com.angcyo.laserpacker.LPDataConstant.DATA_TYPE_SVG]
  ///
  int mtype = -1;

  /// 图层名称; 如果不指定; 则通过[mtype]类型获取
  String? name;

  /// 相同id的视为在同一组 string `2023-1-6`
  String? groupId;

  /// [groupId] 需要显示的名称
  String? groupName;

  /// 填充颜色; 形状的颜色
  /// ```
  /// #ff00ff
  /// ```
  ///
  String? fill;

  /// 描边颜色; 如果有
  /// ```
  /// #ff00ff
  /// ```
  ///
  String? stroke;

  /// 0 [Paint.Style.FILL]
  /// 1 [Paint.Style.STROKE]
  /// 2 [Paint.Style.FILL_AND_STROKE]
  /// [LpPaintingStyleEx.styleInt]
  /// [LpIntEx.paintStyle]
  int paintStyle = PaintingStyle.stroke.styleInt;

  /// 原始的数据; 如svg文件内容; gcode文件内容
  /// [LPDataConstant.DATA_TYPE_RAW] 真实数据的类型
  /// [Charsets.ISO_8859_1]
  /// [path]
  ///
  String? data;

  /// [LpConstants.projectV2BaseUri]
  String? dataUri;

  /// 是否可见
  bool isVisible = true;

  /// 是否锁定了图层
  bool isLock = false;

//endregion ---公共属性---
}
