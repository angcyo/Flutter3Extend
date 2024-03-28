part of '../../lp_canvas.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/26
///
class LpProject {
  /// 创建一个图片元素
  /// [ElementBean]
  /// [LpConstants.dataTypeBitmap]
  static ElementBean? createImageBean({
    UiImage? image,
  }) {
    ElementBean bean = ElementBean();
    bean.mtype = LpConstants.dataTypeBitmap;
    bean.width = image?.width.toDouble() ?? 0;
    bean.height = image?.height.toDouble() ?? 0;
    return bean;
  }

  /// 从给定的数据中, 解析出一个元素[ElementPainter]
  static ElementPainter? parseElementPainter() {
    return null;
  }

  /// 创建一个形状元素
  /// [side] 边数
  /// [depth] 深度
  /// [LpConstants.dataTypeLine]
  /// [LpConstants.dataTypeRect]
  /// [LpConstants.dataTypeOval]
  /// [LpConstants.dataTypePolygon]
  /// [LpConstants.dataTypePentagram]
  /// [LpConstants.dataTypeLove]
  static ElementPainter? createShapeElementPainter(
    int mtype, {
    @mm double rx = 0,
    @mm double ry = 0,
    int side = 3,
    int depth = 40,
  }) {
    ElementBean bean = ElementBean();
    bean.mtype = mtype;
    bean.width = LpConstants.defaultShapeWidth;
    bean.height = LpConstants.defaultShapeWidth;
    if (mtype == LpConstants.dataTypeLine) {
      bean.height = 0;
    }
    bean.rx = rx;
    bean.ry = ry;
    bean.side = side;
    bean.depth = depth;
    LpPathElement element = LpPathElement();
    element.elementBean = bean;
    element.updatePropertyFromBean();
    return element;
  }
}
