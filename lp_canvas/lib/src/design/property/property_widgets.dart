part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/21
///

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
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

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
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

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
          context: context,
          widget: AlignDialog(canvasDelegate),
          /*barrierColor: null,*/
          type: TranslationType.translation,
        );
      },
    );
  }
}

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
      enable: selectedElementCount > 2,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}
