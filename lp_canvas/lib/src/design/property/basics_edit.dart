part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/18
///
/// 基础属性编辑小部件
class CanvasBasicsEditWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasBasicsEditWidget({super.key, this.layoutController});

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

    @dp
    final selectBounds = canvasElementControlManager?.selectBounds;

    // 是否锁定比例
    final isLockRatio = elementSelectComponent?.isLockRatio == true;

    //debugger();
    const svgSize = 25.0;
    return [
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
            canvasElementControlManager?.scaleElement(elementSelectComponent,
                sx: sx, sy: sy);
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
            canvasElementControlManager?.scaleElement(elementSelectComponent,
                sx: sx, sy: sy);
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
      ),
      CanvasNumberInputWidget(
        text: "Y".text(),
        number: selectBounds?.top,
        numberFormat: (value) => value == null
            ? null
            : axisUnit?.formatFromDp(value, showSuffix: false),
        tooltip: "Y轴",
      ),
      CanvasNumberInputWidget(
        text: "旋转".text(),
        number: elementSelectComponent?.paintProperty?.angle.jd,
        numberFormat: (value) => value == null ? null : "${value.toDigits()}°",
        tooltip: "旋转",
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.canvasFlipHorizontal),
        tooltip: "水平",
        text: const Text("水平"),
        onTap: () {
          //widget.canvasDelegate?.undo();
          toastInfo("水平");
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.canvasFlipVertical),
        tooltip: "垂直",
        text: const Text("垂直"),
        onTap: () {
          //widget.canvasDelegate?.undo();
          toastInfo("垂直");
        },
      ),
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}
