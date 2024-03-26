part of '../../lp_canvas.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/26
///
class LpProject {
  /// 创建一个图片元素
  /// [ElementBean]
  /// [LpConstants.dataTypeBitmap]
  static ElementBean? createImageBean() {
    ElementBean bean = ElementBean();
    bean.mtype = LpConstants.dataTypeBitmap;
    return bean;
  }
}
