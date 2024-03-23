part of '../lp_device.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///

class LpHelper {
  //region ---图层---

  /// layerFill:填充图层；
  static const layerFill = 'layerFill';

  /// layerPicture：图片图层；
  static const layerPicture = 'layerPicture';

  /// layerLine：线条图层；
  static const layerLine = 'layerLine';

  /// layerCut：切割图层
  static const layerCut = 'layerCut';

  //endregion ---图层---

  //region ---光源---

  /// 0为450nm激光
  static int blueLight = 0;

  /// 1为1064nm激光
  static int whiteLight = 1;

  //endregion ---光源---
}
