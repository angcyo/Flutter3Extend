import 'dart:ui';

import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

import 'lp_element.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/26
/// 图片元素
class LpImageElement extends ImageElementPainter with LpElementMixin {
  /// 原图, 用于操作
  UiImage? originImage;

  @override
  void onPaintingImage(Canvas canvas, PaintMeta paintMeta) {
    paintImage?.let((image) {
      //因为图片的宽高是mm单位存档的, 所以需要转换成dp单位并绘制
      final scale = Matrix4.identity();
      scale.scale(
        image.width.toDpFromMm() / image.width,
        image.height.toDpFromMm() / image.height,
      );

      canvas.withMatrix(
        paintProperty?.operateMatrix.let((it) => it * scale),
        () {
          canvas.drawImage(image, Offset.zero, paint);
        },
      );
    });
  }
}
