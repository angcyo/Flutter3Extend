part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/22
///
/// 排列对话框
class ArrangeDialog extends StatelessWidget with DialogMixin {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  /// 点击后, 关闭对话框
  final bool closeAfterTap;

  const ArrangeDialog(
    this.canvasDelegate, {
    super.key,
    this.closeAfterTap = true,
  });

  @override
  Widget build(BuildContext context) {
    final selectedElementCount =
        canvasDelegate?.canvasElementManager.selectedElementCount ?? 0;
    final elementSelectComponent =
        canvasDelegate?.canvasElementManager.elementSelectComponent;
    return buildBottomColumnDialog(context, [
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.arrangeTop),
        text: "上移一层",
        enable: canvasDelegate?.canvasElementManager.canArrangeElement(
                elementSelectComponent, CanvasArrangeType.up) ==
            true,
        onTap: () {
          canvasDelegate?.canvasElementManager
              .arrangeElement(elementSelectComponent, CanvasArrangeType.up);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.arrangeDown),
        text: "下移一层",
        enable: canvasDelegate?.canvasElementManager.canArrangeElement(
                elementSelectComponent, CanvasArrangeType.down) ==
            true,
        onTap: () {
          canvasDelegate?.canvasElementManager
              .arrangeElement(elementSelectComponent, CanvasArrangeType.down);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.arrangeTop),
        text: "置为顶层",
        enable: canvasDelegate?.canvasElementManager.canArrangeElement(
                elementSelectComponent, CanvasArrangeType.top) ==
            true,
        onTap: () {
          canvasDelegate?.canvasElementManager
              .arrangeElement(elementSelectComponent, CanvasArrangeType.top);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.arrangeBottom),
        text: "置为底层",
        enable: canvasDelegate?.canvasElementManager.canArrangeElement(
                elementSelectComponent, CanvasArrangeType.bottom) ==
            true,
        onTap: () {
          canvasDelegate?.canvasElementManager
              .arrangeElement(elementSelectComponent, CanvasArrangeType.bottom);
          closeDialogIf(context, closeAfterTap);
        },
      ),
    ]);
  }
}
