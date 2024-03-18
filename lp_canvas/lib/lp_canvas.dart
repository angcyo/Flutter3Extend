library lp_canvas;

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import 'assets_generated/assets.gen.dart';

export 'src/design/canvas_design.dart';

/// [toast]
lpCanvasToast(Widget msg) => toastBlur(msg: msg);

Widget lpCanvasBackWidget({
  Color? tintColor,
  UiColorFilter? colorFilter,
  BoxFit fit = BoxFit.contain,
  double? width,
  double? height,
}) =>
    loadAssetSvgWidget(
      Assets.svg.canvasBack,
      package: "lp_canvas",
      tintColor: tintColor,
      colorFilter: colorFilter,
      width: width,
      height: height,
      fit: fit,
    );

Widget lpCanvasNextWidget({
  Color? tintColor,
  UiColorFilter? colorFilter,
  BoxFit fit = BoxFit.contain,
  double? width,
  double? height,
}) =>
    loadAssetSvgWidget(
      Assets.svg.canvasNext,
      package: "lp_canvas",
      tintColor: tintColor,
      colorFilter: colorFilter,
      width: width,
      height: height,
      fit: fit,
    );

/// [loadAssetSvgWidget]
Widget lpCanvasSvgWidget(
  String key, {
  Color? tintColor,
  UiColorFilter? colorFilter,
  BoxFit fit = BoxFit.contain,
  double? width,
  double? height,
}) =>
    loadAssetSvgWidget(
      key,
      package: "lp_canvas",
      tintColor: tintColor,
      colorFilter: colorFilter,
      width: width,
      height: height,
      fit: fit,
    );

/// [loadAssetImageWidget]
Widget? lpCanvasImageWidget(
  String? key, {
  BoxFit? fit,
  double? width,
  double? height,
}) =>
    loadAssetImageWidget(
      key,
      package: "lp_canvas",
      fit: fit,
      width: width,
      height: height,
    );
