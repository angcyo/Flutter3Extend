part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/21
///
/// 排列触发小部件
class ArrangeWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ArrangeWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '排列';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasArrange),
      tooltip: text,
      enable: canvasDelegate?.canvasElementManager.isSelectedElement == true,
      text: const Text(text),
      onTap: () {
        showDialogWidget(
          context,
          ArrangeDialog(canvasDelegate),
          /*barrierColor: null,*/
          type: TranslationType.translation,
        );
      },
    );
  }
}

/// 栅格化小部件
class RasterizeWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const RasterizeWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '栅格化';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasRasterize),
      tooltip: text,
      text: const Text(text),
      enable: canvasDelegate?.canvasElementManager.isSelectedElement == true,
      onTap: () async {
        final elementSelectComponent =
            canvasDelegate?.canvasElementManager.elementSelectComponent;
        final image =
            await CanvasDelegate.rasterizeElement(elementSelectComponent);
        if (image != null) {
          final imageElementPainter = ImageElementPainter();
          imageElementPainter.initFromImage(image);
          imageElementPainter.updateBoundsTo(
              elementSelectComponent?.paintProperty?.getBounds(true));
          canvasDelegate?.canvasElementManager
              .replaceElement(elementSelectComponent, imageElementPainter);
        }
      },
    );
  }
}

/// 群组小部件
class GroupWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const GroupWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '编组';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasGroup),
      tooltip: text,
      text: const Text(text),
      enable:
          canvasDelegate?.canvasElementManager.isSelectedGroupPainter == false,
      onTap: () {
        canvasDelegate?.canvasElementManager.groupElement(canvasDelegate
            ?.canvasElementManager.elementSelectComponent?.children);
      },
    );
  }
}

/// 解组小部件
class UngroupWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const UngroupWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '解组';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasUngroup),
      tooltip: text,
      text: const Text(text),
      enable:
          canvasDelegate?.canvasElementManager.isSelectedGroupPainter == true,
      onTap: () {
        canvasDelegate?.canvasElementManager.ungroupElement(
            canvasDelegate?.canvasElementManager.selectedElement);
      },
    );
  }
}

/// 对齐小部件
class AlignWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AlignWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElementCount =
        canvasDelegate?.canvasElementManager.selectedElementCount ?? 0;
    const text = '对齐';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasAlign),
      tooltip: text,
      text: const Text(text),
      enable: selectedElementCount > 1,
      onTap: () {
        showDialogWidget(
          context,
          AlignDialog(canvasDelegate),
          /*barrierColor: null,*/
          type: TranslationType.translation,
        );
      },
    );
  }
}

/// 均分小部件
class AverageWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AverageWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final selectedElementCount =
        canvasDelegate?.canvasElementManager.selectedElementCount ?? 0;
    const text = '均分';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasAverage),
      tooltip: text,
      enable: selectedElementCount >= 2,
      text: const Text(text),
      onTap: () {
        showDialogWidget(
          context,
          AverageDialog(canvasDelegate),
          /*barrierColor: null,*/
          type: TranslationType.translation,
        );
      },
    );
  }
}

/// 形状选择小部件
class ShapePropertyWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const ShapePropertyWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    final elementManager = canvasDelegate?.canvasElementManager;
    return [
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.shapeLine),
        tooltip: "线条",
        text: const Text("线条"),
        onTap: () {
          elementManager?.addElement(
            LpProject.createShapeElementPainter(LpConstants.dataTypeLine),
            selected: true,
          );
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.shapeOval),
        tooltip: "椭圆",
        text: const Text("椭圆"),
        onTap: () {
          elementManager?.addElement(
            LpProject.createShapeElementPainter(LpConstants.dataTypeOval),
            selected: true,
          );
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.shapeRect),
        tooltip: "矩形",
        text: const Text("矩形"),
        onTap: () {
          elementManager?.addElement(
            LpProject.createShapeElementPainter(LpConstants.dataTypeRect),
            selected: true,
          );
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.shapePolygon),
        tooltip: "多边形",
        text: const Text("多边形"),
        onTap: () {
          elementManager?.addElement(
            LpProject.createShapeElementPainter(LpConstants.dataTypePolygon),
            selected: true,
          );
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.shapePentagram),
        tooltip: "星形",
        text: const Text("星形"),
        onTap: () {
          elementManager?.addElement(
            LpProject.createShapeElementPainter(LpConstants.dataTypePentagram,
                side: 5),
            selected: true,
          );
        },
      ),
      CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.shapeLove),
        tooltip: "心形",
        text: const Text("心形"),
        onTap: () {
          elementManager?.addElement(
            LpProject.createShapeElementPainter(LpConstants.dataTypeLove),
            selected: true,
          );
        },
      ),
    ].row(mainAxisSize: MainAxisSize.max)!;
  }
}
