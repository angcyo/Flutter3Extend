import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

import 'lp_element.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/26
///
class LpImageElement extends ImageElementPainter with LpElementMixin {
  /// 原图, 用于操作
  UiImage? originImage;
}
