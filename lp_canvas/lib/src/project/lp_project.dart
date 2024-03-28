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
}
