part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/18
///
/// 基础属性编辑小部件
class CanvasBasicsEditWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasBasicsEditWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    final canvasElementControlManager =
        canvasDelegate?.canvasElementManager.canvasElementControlManager;

    final axisUnit = canvasDelegate?.axisUnit;
    final elementSelectComponent =
        canvasDelegate?.canvasElementManager.elementSelectComponent;
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;
    final elementProperty = selectedElement?.paintProperty;

    final isSelectedElement =
        canvasDelegate?.canvasElementManager.isSelectedElement == true;

    @dp
    final selectBounds = canvasElementControlManager?.selectBounds;

    // 是否锁定比例
    final isLockRatio = elementSelectComponent?.isLockRatio == true;

    //debugger();
    const svgSize = 25.0;
    return [
      ArrangeWidget(canvasDelegate),
      RasterizeWidget(canvasDelegate),
      canvasDesignVerticalLine,
      CanvasNumberInputWidget(
        text: "W".text(),
        number: selectBounds?.width,
        numberFormat: (value) => value == null
            ? null
            : axisUnit?.formatFromDp(value, showSuffix: false),
        tooltip: "宽度",
        onNumberInput: (value) {
          if (value != null) {
            //debugger();
            @dp
            final newWidth = IUnit.dp.toUnitFromUnit(axisUnit!, value);
            final sx = newWidth / (selectBounds?.width ?? 1);
            final double sy;
            if (isLockRatio) {
              sy = sx;
            } else {
              sy = 1;
            }
            canvasElementControlManager?.scaleElement(
              elementSelectComponent,
              sx: sx,
              sy: sy,
              isLockRatio: isLockRatio,
            );
          }
        },
      ),
      [
        const Line(
          axis: Axis.horizontal,
          indent: -2,
          endIndent: -2,
        ),
        (isLockRatio
            ? canvasLockWidget(
                tintColor: Colors.black,
                width: svgSize,
                height: svgSize,
              )
            : canvasUnlockWidget(
                tintColor: Colors.black,
                width: svgSize,
                height: svgSize,
              ))
      ]
          .stack(alignment: Alignment.center)!
          .ink(
              onTap: () {
                canvasElementControlManager?.updateElementLockState();
              },
              shape: BoxShape.circle)
          .material()
          .align(Alignment.topCenter)
          .constrained(maxHeight: 45),
      CanvasNumberInputWidget(
        text: "H".text(),
        number: selectBounds?.height,
        numberFormat: (value) => value == null
            ? null
            : axisUnit?.formatFromDp(value, showSuffix: false),
        tooltip: "高度",
        onNumberInput: (value) {
          if (value != null) {
            @dp
            final newHeight = IUnit.dp.toUnitFromUnit(axisUnit!, value);
            final sy = newHeight / (selectBounds?.height ?? 1);
            final double sx;
            if (isLockRatio) {
              sx = sy;
            } else {
              sx = 1;
            }
            canvasElementControlManager?.scaleElement(
              elementSelectComponent,
              sx: sx,
              sy: sy,
              isLockRatio: isLockRatio,
            );
          }
        },
      ),
      CanvasNumberInputWidget(
        text: "X".text(),
        number: selectBounds?.left,
        numberFormat: (value) => value == null
            ? null
            : axisUnit?.formatFromDp(value, showSuffix: false),
        tooltip: "X轴",
        onNumberInput: (value) {
          if (value != null) {
            @dp
            final oldX = selectBounds?.left ?? 0;
            final newX = IUnit.dp.toUnitFromUnit(axisUnit!, value);
            canvasElementControlManager
                ?.translateElement(elementSelectComponent, dx: newX - oldX);
          }
        },
      ),
      CanvasNumberInputWidget(
        text: "Y".text(),
        number: selectBounds?.top,
        numberFormat: (value) => value == null
            ? null
            : axisUnit?.formatFromDp(value, showSuffix: false),
        tooltip: "Y轴",
        onNumberInput: (value) {
          if (value != null) {
            @dp
            final oldY = selectBounds?.top ?? 0;
            final newY = IUnit.dp.toUnitFromUnit(axisUnit!, value);
            canvasElementControlManager
                ?.translateElement(elementSelectComponent, dy: newY - oldY);
          }
        },
      ),
      CanvasNumberInputWidget(
        text: "旋转".text(),
        number: elementSelectComponent?.paintProperty?.angle.jd,
        numberFormat: (value) => value == null ? null : "${value.toDigits()}°",
        tooltip: "旋转",
        onNumberInput: (value) {
          if (value != null) {
            canvasElementControlManager?.rotateElement(
                elementSelectComponent, value.hd);
          }
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.canvasFlipHorizontal),
        tooltip: "水平",
        text: const Text("水平"),
        enable: isSelectedElement,
        onTap: () {
          canvasElementControlManager?.flipElementWithScale(
            elementSelectComponent,
            flipX: true,
          );
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.canvasFlipVertical),
        tooltip: "垂直",
        text: const Text("垂直"),
        enable: isSelectedElement,
        onTap: () {
          canvasElementControlManager?.flipElementWithScale(
            elementSelectComponent,
            flipY: true,
          );
        },
      ),
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}

/// 一组元素基础编辑
class CanvasGroupEditWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasGroupEditWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      GroupWidget(canvasDelegate),
      UngroupWidget(canvasDelegate),
      canvasDesignVerticalLine,
      AlignWidget(canvasDelegate),
      AverageWidget(canvasDelegate),
      canvasDesignVerticalLine,
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}

/// 图片属性编辑
class CanvasPictureEditWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasPictureEditWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      ImageFilterBw(canvasDelegate),
      ImageFilterDithering(canvasDelegate),
      ImageFilterGCode(canvasDelegate),
      ImageFilterPrint(canvasDelegate),
      ImageFilterSeal(canvasDelegate),
      ImageFilterGrey(canvasDelegate),
      ImageFilter2DRelief(canvasDelegate),
      canvasDesignVerticalLine,
      ImageMagicWand(canvasDelegate),
      ImageOutline(canvasDelegate),
      ImageTracer(canvasDelegate),
      ImageCrop(canvasDelegate),
      canvasDesignVerticalLine,
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}

/// 矢量属性编辑
class CanvasPathEditWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasPathEditWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      ImageMagicWand(canvasDelegate),
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}

/// 文本属性编辑
class CanvasTextEditWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasTextEditWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      ImageMagicWand(canvasDelegate),
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}
