import 'dart:ui';

import 'package:flutter3_app/flutter3_app.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lp_canvas/lp_canvas.dart';

part 'element_bean.g.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///
/// 描述元素的数据结构
@JsonSerializable()
class ElementBean {
  factory ElementBean.fromJson(Map<String, dynamic> json) =>
      _$ElementBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ElementBeanToJson(this);

  ElementBean();

  //region ---bounds---

  /// 数据所在位置
  @mm
  double? left;

  @mm
  double? top;

  /// 数据原始的宽高; 线条的长度
  /// 如果是图片元素; 则存储的就是图片的像素宽高
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
  /// [LpConstants.dataTypeText]
  /// [LpConstants.dataTypeRect]
  /// [LpConstants.dataTypeSvg]
  /// [LpConstants.dataTypeBitmap]
  /// [LpConstants.dataTypeGcode]
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
  /// [LpConstants.DATA_TYPE_RAW] 真实数据的类型
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

  //region ---文本类型---

  /// 文本的内容; 变量文本的内容
  /// [LpConstants.dataTypeBarcode]
  /// [LpConstants.dataTypeQRCode]
  ///
  String? text;

  /// 二维码编码格式; 编码格式（qrcode）; 编码格式（code128）
  /// [com.google.zxing.BarcodeFormat.QR_CODE]
  /// [com.google.zxing.BarcodeFormat.CODE_128]
  ///
  String? coding;

  /// QrCode纠错级别
  /// L M Q H
  String? eclevel = "H";

  /// QR 码掩码图案 [0~8)
  /// -1:自动
  ///
  int? qrMaskPattern = -1;

  /// PDF_417纠错程度:[0~8]
  /// Aztec纠错:[0~100]
  ///
  int? errorLevel;

  /// 字符显示样式: `2023-9-9`
  /// top:显示在条码上
  /// bottom:显示在条码上
  /// none:不显示
  ///
  String? textShowStyle;

  /// 文本的对齐方式
  /// [Paint.Align.toAlignString]
  ///
  String? textAlign = TextAlign.left.alignString;

  /// 字体大小
  @mm
  double fontSize = 10;

  /// 字间距
  @mm
  double charSpacing = LpConstants.defaultCharSpacing;

  /// 行间距
  @mm
  double lineSpacing = LpConstants.defaultCharSpacing;

  /// 字体名称
  String? fontFamily;

  /// 2024-03-23 字体资源路径
  String? fontUri;

  /// 是否加粗
  bool fontWeight = false;

  /// 是否斜体
  bool fontStyle = false;

  /// 下划线
  bool underline = false;

  /// 删除线
  bool linethrough = false;

  /// 文本排列方向
  int orientation = kHorizontal;

  /// 绘制紧凑文本; 这种绘制方式的文本边框留白少
  bool isCompactText = true;

  /// 文本颜色
  String? textColor;

  /// 2023-6-2
  /// 曲线文本曲率[-360~360]; 0表示正常文本
  double curvature = 0;

  /// 变量模板类型
  List<VariableBean>? variables;

  //endregion ---文本类型---

  //region ---形状---

  /// 水平圆角半径; 矩形/椭圆
  /// 椭圆矩形的宽度 = [rx] * 2
  ///
  @mm
  double? rx;

  /// 垂直圆角半径; 矩形/椭圆
  /// 椭圆矩形的高度 = [ry] * 2
  ///
  @mm
  double? ry;

  /// 星星/多边形的边数 5 [3-50]
  /// [com.angcyo.canvas.graphics.PolygonGraphicsParser]
  /// [com.angcyo.canvas.graphics.PentagramGraphicsParser]
  ///
  int side = 3;

  /// 星星的深度 40 [1-100]; 深度越大内圈半径越小
  /// 固定外圈半径; 那么 内圈半径 = 固定外圈半径 * (1-[depth] / 100)
  ///
  /// [com.angcyo.canvas.graphics.PentagramGraphicsParser]
  ///
  int depth = 40;

  //endregion ---形状---

  //region ---SVG path数据---

  /// SVG路径数据
  /// "M0;0L100;100Z"
  ///
  String? path;

  /// 虚线线宽
  @mm
  double dashWidth = 1;

  /// 虚线线距
  @mm
  double dashGap = 1;

  //endregion ---SVG path数据---

  //region ---图片数据---

  /// 原图数据 (data:image/xxx;base64;xxx) 需要协议头
  String? imageOriginal;

  /// [LpConstants.projectV2BaseUri]
  String? imageOriginalUri;

  /// 滤镜后显示图 string; 带协议头
  /// 当图片转成GCode后, 数据放在[data]中
  String? src;

  /// [LpConstants.projectV2BaseUri]
  String? srcUri;

  /// 图片滤镜
  /// 图片滤镜 'black'(黑白) | 'seal'(印章) | 'gray'(灰度) | 'prints'(版画) | 'Jitter(抖动)' | 'gcode'
  /// imageFilter 图片滤镜 1:黑白 | 2:印章 | 3:灰度 | 4:版画 | 5:抖动 | 6:gcode | 7:2D浮雕 `2023-10-7`
  ///
  /// [LpConstants.imageFilterBlackWhite]
  /// [LpConstants.imageFilterSeal]
  /// [LpConstants.imageFilterGrey]
  /// [LpConstants.imageFilterPrint]
  /// [LpConstants.imageFilterDithering]
  /// [LpConstants.imageFilterGCode]
  ///
  ///
  int imageFilter = LpConstants.imageFilterDithering;

  /// 对比度
  double contrast = 0;

  /// 亮度
  double brightness = 0;

  /// 黑白阈值
  double blackThreshold = lpCanvasKeys.lastBWThreshold;

  /// 印章阈值
  double sealThreshold = lpCanvasKeys.lastSealThreshold;

  /// 版画阈值
  double printsThreshold = lpCanvasKeys.lastPrintThreshold;

  /// 是否反色
  bool inverse = false;

  /// gcode线距
  double gcodeLineSpace = 5;

  /// gcode填充线的角度[0-90]
  double gcodeAngle = 0;

  /// gcode是否需要轮廓
  bool gcodeOutline = true;

  /// 2022-12-30 矢量使用GCode线段填充线距(毫米); 大于0时生效
  /// [paintStyle] == 1 笔的样式必须是描边时; 才有效
  ///
  @mm
  double gcodeFillStep = 0;

  /// 路径填充的角度
  /// [gcodeFillStep]
  double gcodeFillAngle = 0;

  /// 是否扭曲
  bool isMesh = false;

  /// 最小直径; 最大直径
  @mm
  double? minDiameter;

  @mm
  double? maxDiameter;

  /// 扭曲类型;
  /// "CONE" 圆锥
  /// "BALL" 球体
  ///
  String? meshShape;

  /// 切片的数量
  int sliceCount = 0;

  /// 每一层下降的高度 mm单位
  @mm
  double sliceHeight = lpCanvasKeys.minSliceHeight;

  /// 2d浮雕强度[1~20]
  int reliefStrength = 1;

  //endregion ---图片数据---

  //region ---雕刻参数/LaserOptionsBean---

  /// 发给机器的数据索引
  /// 当数据没有改变时; 相同的索引不必重复发送数据给机器
  int? index;

  //---

  /// [LaserOptionsBean.lightSource]
  int? lightSource;

  /// [LaserOptionsBean.precision]
  int? precision;

  /// 雕刻次数
  /// [LaserOptionsBean.printCount]
  int? printCount;

  /// [LaserOptionsBean.printDepth]
  int? printDepth;

  /// [LaserOptionsBean.printPower]
  int? printPower;

  /// [LaserOptionsBean.dpi]
  double? dpi;

  /// [0~255] 气泵等级/风速等级 2023-12-12
  int? pump;

  //---

  /// [LaserOptionsBean.materialCode]
  String? materialCode;

  /// [LaserOptionsBean.materialKey]
  String? materialKey;

  /// [LaserOptionsBean.materialName]
  String? materialName;

  /// [LaserOptionsBean.materialId]
  String? materialId;

  //---

  /// 2023-11-7 雕刻速度; 支持15000这样的大值
  int? bigSpeed;

  /// 2023-11-4
  /// 是否要使用激光器出光频率
  bool useLaserFrequency = false;

  /// 2023-10-30
  /// 激光器出光频率，取值范围为26-60，单位kHz
  /// 默认60kHz
  ///
  int? laserFrequency;

  /// 是否是切割
  bool isCut = false;

//endregion ---雕刻参数/LaserOptionsBean---
}
