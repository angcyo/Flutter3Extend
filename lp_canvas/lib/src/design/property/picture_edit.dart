import 'package:flutter/material.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';
import 'package:lp_canvas/src/project/element/lp_element.dart';

import '../../../assets_generated/assets.gen.dart';
import '../../../lp_canvas.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/28
///
class ImageFilterBw extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilterBw(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilterBw),
      tooltip: "黑白画",
      showCheckedTip: imageFilter == LpConstants.imageFilterBlackWhite,
      text: const Text("黑白画"),
      onTap: () {},
    );
  }
}

class ImageFilterDithering extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilterDithering(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilterDithering),
      showCheckedTip: imageFilter == LpConstants.imageFilterDithering,
      tooltip: "抖动",
      text: const Text("抖动"),
      onTap: () {},
    );
  }
}

class ImageFilterGCode extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilterGCode(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilterGcode),
      showCheckedTip: imageFilter == LpConstants.imageFilterGCode,
      tooltip: "GCode",
      text: const Text("GCode"),
      onTap: () {},
    );
  }
}

class ImageFilterPrint extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilterPrint(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilterPrint),
      showCheckedTip: imageFilter == LpConstants.imageFilterPrint,
      tooltip: "版画",
      text: const Text("版画"),
      onTap: () {},
    );
  }
}

class ImageFilterSeal extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilterSeal(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilterSeal),
      showCheckedTip: imageFilter == LpConstants.imageFilterSeal,
      tooltip: "印章",
      text: const Text("印章"),
      onTap: () {},
    );
  }
}

class ImageFilterGrey extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilterGrey(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilterGrey),
      showCheckedTip: imageFilter == LpConstants.imageFilterGrey,
      tooltip: "灰度",
      text: const Text("灰度"),
      onTap: () {},
    );
  }
}

class ImageFilter2DRelief extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageFilter2DRelief(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final imageFilter = selectedElement?.elementBean?.imageFilter;
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageFilter2drelief),
      showCheckedTip: imageFilter == LpConstants.imageFilterRelief,
      tooltip: "2D浮雕",
      text: const Text("2D浮雕"),
      onTap: () {},
    );
  }
}

class ImageMagicWand extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageMagicWand(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageMagicWand),
      tooltip: "魔术橡皮",
      text: const Text("魔术橡皮"),
      onTap: () {},
    );
  }
}

class ImageOutline extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageOutline(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageOutline),
      tooltip: "轮廓",
      text: const Text("轮廓"),
      onTap: () {},
    );
  }
}

class ImageTracer extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageTracer(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageTracer),
      tooltip: "位图临摹",
      text: const Text("位图临摹"),
      onTap: () {},
    );
  }
}

class ImageCrop extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ImageCrop(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.imageCrop),
      tooltip: "剪裁",
      text: const Text("剪裁"),
      onTap: () {},
    );
  }
}
