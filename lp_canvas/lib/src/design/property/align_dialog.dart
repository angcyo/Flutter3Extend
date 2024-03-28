part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/21
///
/// 对齐对话框
class AlignDialog extends StatelessWidget with DialogMixin {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  /// 点击后, 关闭对话框
  final bool closeAfterTap;

  const AlignDialog(
    this.canvasDelegate, {
    super.key,
    this.closeAfterTap = true,
  });

  @override
  Widget build(BuildContext context) {
    final elementSelectComponent =
        canvasDelegate?.canvasElementManager.elementSelectComponent;
    return buildBottomColumnDialog(context, [
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignLeft),
        text: "左对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.left);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignTop),
        text: "顶对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.top);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignRight),
        text: "右对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.right);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignBottom),
        text: "底对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.bottom);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignHorizontal),
        text: "水平居中",
        onTap: () {
          canvasDelegate?.canvasElementManager.alignElement(
              elementSelectComponent, CanvasAlignType.horizontalCenter);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignVertical),
        text: "垂直居中",
        onTap: () {
          canvasDelegate?.canvasElementManager.alignElement(
              elementSelectComponent, CanvasAlignType.verticalCenter);
          closeDialogIf(context, closeAfterTap);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignCenter),
        text: "居中",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.center);
          closeDialogIf(context, closeAfterTap);
        },
      ),
    ]);
  }
}
