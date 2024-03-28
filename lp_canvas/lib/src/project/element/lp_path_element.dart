import 'dart:math';
import 'dart:ui';

import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

import '../../../lp_canvas.dart';
import 'lp_element.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/28
///

class LpPathElement extends PathElementPainter with LpElementMixin {
  /// 创建路径元素
  static Path? createPathFromBean(ElementBean? bean) {
    if (bean != null) {
      @dp
      final width = bean.width?.toDpFromMm() ?? 0;
      final height = bean.height?.toDpFromMm() ?? 0;
      final rx = bean.rx?.toDpFromMm() ?? 0;
      final ry = bean.ry?.toDpFromMm() ?? 0;

      switch (bean.mtype) {
        case LpConstants.dataTypeLine:
          return Path()
            ..moveTo(0, 0)
            ..lineTo(width, height);
        case LpConstants.dataTypeRect:
          return Path()
            ..addRRect(
                Rect.fromLTWH(0, 0, width, height).toRRectFromXY(rx, ry));
        case LpConstants.dataTypeOval:
          return Path()..addOval(Rect.fromLTWH(0, 0, width, height));
        case LpConstants.dataTypePolygon: //多边形
          final side = max(bean.side, 3); //边数 至少需要3边
          final originX = width / 2;
          final originY = height / 2;
          final angleSum = (side - 2.0) * 180.0; //内角和
          final angleOne = angleSum / side; //每条边的角度
          final a = (angleOne / 2).hd; //半条边的弧度

          final maxR = min(originX, originY);

          //底部左边为起点
          final startRadians = pi - a; //开始绘制的弧度

          final path = Path();
          for (int i = 0; i < side; i++) {
            final radians = startRadians + pi * 2 / side * i; //弧度
            final nextX = originX + maxR * cos(radians);
            final nextY = originY + maxR * sin(radians);
            if (i == 0) {
              path.moveTo(nextX, nextY);
            } else {
              path.lineTo(nextX, nextY);
            }
          }
          path.close();

          return path;
        case LpConstants.dataTypePentagram: //五角星
          final side = bean.side; //边数
          final depth =
              bean.depth; //深度, 决定内圈的半径 (内圈半径 = 固定外圈半径 * (1 - [depth] / 100))
          final R = min(width, height) / 2.0; //五角星外圆的半径
          final r = R * (1 - depth * 1.0 / 100.0); //星星内圆的半径

          final originX = width / 2;
          final originY = height / 2;

          const startRadians = pi / 2; //开始绘制的弧度

          final path = Path();
          //从底部中心开始的角度
          final step = 360.0 / (side * 2);
          for (int i = 0; i <= side * 2; i++) {
            final radians = startRadians + step * i.hd;
            final nextX = originX + (i.isEven ? r : R) * cos(radians);
            final nextY = originY + (i.isEven ? r : R) * sin(radians);
            if (i == 0) {
              path.moveTo(nextX, nextY);
            } else {
              path.lineTo(nextX, nextY);
            }
          }

          path.close();
          return path;
        case LpConstants.dataTypeLove: //爱心
          final path = "M12 21.593"
                  "c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 "
                  "4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 "
                  "5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402"
              .toUiPath();
          return path;
      }
    }
    return null;
  }

  @override
  void onPaintingSelf(Canvas canvas, PaintMeta paintMeta) {
    //debugger();
    paintPath ??= createPathFromBean(elementBean)?.moveToZero(
      width: paintProperty?.width,
      height: paintProperty?.height,
    );
    super.onPaintingSelf(canvas, paintMeta);
  }
}
