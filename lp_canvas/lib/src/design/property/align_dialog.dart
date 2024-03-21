part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/21
///
/// 对齐对话框
class AlignDialog extends StatelessWidget {
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
    return [
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignLeft),
        text: "左对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.left);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignTop),
        text: "顶对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.top);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignRight),
        text: "右对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.right);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignBottom),
        text: "底对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.bottom);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignHorizontal),
        text: "水平居中",
        onTap: () {
          canvasDelegate?.canvasElementManager.alignElement(
              elementSelectComponent, CanvasAlignType.horizontalCenter);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignVertical),
        text: "垂直居中",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.verticalCenter);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignCenter),
        text: "居中",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlignType.center);
          checkClose(context);
        },
      ),
    ]
        .column()!
        .container(color: Colors.white)
        .matchParent(matchHeight: false)
        .align(Alignment.bottomCenter);
  }

  void checkClose(BuildContext context) {
    if (closeAfterTap) {
      Navigator.of(context).pop();
    }
  }
}
