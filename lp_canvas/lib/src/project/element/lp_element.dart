import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';
import 'package:lp_canvas/lp_canvas.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/26
///
mixin LpElementMixin on ElementPainter {
  /// 数据结构
  ElementBean? elementBean;

  /// 从[elementBean]中初始化[paintProperty]属性
  /// [updateNotify] 是否通知属性变更
  @api
  void updatePropertyFromBean({
    bool updateNotify = false,
  }) {
    final property = paintProperty ?? PaintProperty();
    property
      ..left = elementBean?.left?.toDpFromMm() ?? 0
      ..top = elementBean?.top?.toDpFromMm() ?? 0
      ..width = elementBean?.width?.toDpFromMm() ?? 0
      ..height = elementBean?.height?.toDpFromMm() ?? 0
      ..angle = elementBean?.angle?.hd ?? 0
      ..scaleX = elementBean?.scaleX ?? 1
      ..scaleY = elementBean?.scaleY ?? 1
      ..flipX = elementBean?.flipX ?? false
      ..flipY = elementBean?.flipY ?? false
      ..skewX = elementBean?.skewX?.hd ?? 0
      ..skewY = elementBean?.skewY?.hd ?? 0;
    if (updateNotify || paintProperty == null) {
      paintProperty = property;
    }
  }

  /// 保存[paintProperty]属性到[elementBean]中
  @api
  void savePropertyToBean() {
    elementBean
      ?..left = paintProperty?.left.toMmFromDp()
      ..top = paintProperty?.top.toMmFromDp()
      ..width = paintProperty?.width.toMmFromDp()
      ..height = paintProperty?.height.toMmFromDp()
      ..angle = paintProperty?.angle.jd
      ..scaleX = paintProperty?.scaleX
      ..scaleY = paintProperty?.scaleY
      ..flipX = paintProperty?.flipX ?? false
      ..flipY = paintProperty?.flipY ?? false
      ..skewX = paintProperty?.skewX.jd
      ..skewY = paintProperty?.skewY.jd;
  }
}
