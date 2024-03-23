part of '../../lp_canvas.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///

class LpConstants {
  /// 默认的阈值
  static const defaultThreshold = 240.0;

  /// 默认的字间距
  @mm
  static const defaultCharSpacing = 0.5;

  /// 第二版结构中, 工程默认的结构数据放在zip包里面此流中
  static const projectV2DefaultName = ".lpproject";

  /// 第二版结构中, 预览图放在zip包里面此流中
  static const projectV2PreviewName = "preview.png";

  /// V2: 所有资源存放的基础路径
  static const projectV2BaseUri = "res/";

  //---

  //region ---图片滤镜---

  /// 数数据模式, 黑白, 发送线段数据
  /// 对应传输给机器的数据类型:
  /// [com.angcyo.bluetooth.fsc.laserpacker.command.DataCmd.ENGRAVE_TYPE_BITMAP_PATH]
  ///
  static const imageFilterBlackWhite = 1;

  /// 数据模式, 灰度
  /// 对应传输给机器的数据类型:
  /// [com.angcyo.bluetooth.fsc.laserpacker.command.DataCmd.ENGRAVE_TYPE_BITMAP]
  static const imageFilterGrey = 3;

  /// 数据模式, 抖动, 发送抖动数据
  /// 对应传输给机器的数据类型:
  /// [com.angcyo.bluetooth.fsc.laserpacker.command.DataCmd.ENGRAVE_TYPE_BITMAP_DITHERING]
  ///
  static const imageFilterDithering = 5;

  /// 数据模式, GCode, 发送GCode数据
  /// 对应传输给机器的数据类型:
  /// [com.angcyo.bluetooth.fsc.laserpacker.command.DataCmd.ENGRAVE_TYPE_GCODE]
  ///
  static const imageFilterGCode = 6;

  /// 2D浮雕
  /// 对应传输给机器的数据类型:
  /// [com.angcyo.bluetooth.fsc.laserpacker.command.DataCmd.ENGRAVE_TYPE_BITMAP]
  ///
  static const imageFilterRelief = 7;

  /// 数据模式, 版画
  static const imageFilterPrint = 4;

  /// 数据模式, 印章
  static const imageFilterSeal = 2;

  //endregion ---图片滤镜---

  //region ---数据类型---

  /// 数据类型, 真实数据
  /// 则[ElementBean.data]中存储的是直接可以发送给机器的数据
  static const dataTypeRaw = 0;

  /// 数据类型, 图片数据
  static const dataTypeBitmap = 10010;

  /// 数据类型, 文本
  static const dataTypeText = 10001;

  /// 数据类型, 二维码
  static const dataTypeQRCode = 10015;

  /// 数据类型, 条形码
  static const dataTypeBarcode = 10016;

  /// 数据类型, 矩形
  static const dataTypeRect = 10005;

  /// 数据类型, 椭圆
  static const dataTypeOval = 10006;

  /// 数据类型, 线条
  static const dataTypeLine = 10008;

  /// 数据类型, 钢笔
  static const dataTypePen = 10002;

  /// 数据类型, 画笔
  static const dataTypeBrush = 10003;

  /// 数据类型, SVG数据/导入进来的矢量元素
  static const dataTypeSvg = 10004;

  /// 数据类型, 多边形
  static const dataTypePolygon = 10007;

  /// 数据类型, 星星
  static const dataTypePentagram = 10009;

  /// 数据类型, 爱心
  static const dataTypeLove = 10012;

  /// 数据类型, 单线字
  static const dataTypeSingleWord = 10013;

  /// 数据类型, GCODE数据
  static const dataTypeGcode = 10020;

  /// 数据类型, Path数据
  static const dataTypePath = 7;

  /// 数据类型, 一组数据
  static const dataTypeGroup = 10;

  /// 数据类型, 变量文本
  static const dataTypeVariableText = 10030;

  /// 数据类型, 变量二维码
  static const dataTypeVariableQrcode = 10031;

  /// 数据类型, 变量条形码
  static const dataTypeVariableBarcode = 10032;

//endregion ---数据类型---
}

extension LpIntEx on int {
  ///  [ElementBean.paintStyle]
  PaintingStyle get paintStyle =>
      this == 1 ? PaintingStyle.stroke : PaintingStyle.fill;
}

extension LpPaintingStyleEx on PaintingStyle {
  ///  [ElementBean.paintStyle]
  int get styleInt => this == PaintingStyle.stroke ? 1 : 0;
}

extension LpStringEx on String {
  /// [ElementBean.textAlign]
  TextAlign get textAlign {
    switch (toLowerCase()) {
      case "center":
        return TextAlign.center;
      case "right":
        return TextAlign.right;
      default:
        return TextAlign.left;
    }
  }
}

extension LpTextAlignEx on TextAlign {
  /// [ElementBean.textAlign]
  String get alignString {
    switch (this) {
      case TextAlign.center:
        return "center";
      case TextAlign.right:
        return "right";
      default:
        return "left";
    }
  }
}
