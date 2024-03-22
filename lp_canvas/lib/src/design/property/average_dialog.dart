part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/21
///
/// 均分对话框
class AverageDialog extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  /// 点击后, 关闭对话框
  final bool closeAfterTap;

  const AverageDialog(
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
    return [
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.averageHorizontal),
        text: "水平均分",
        enable: selectedElementCount > 2,
        onTap: () {
          canvasDelegate?.canvasElementManager.averageElement(
              elementSelectComponent, CanvasAverageType.horizontal);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.averageVertical),
        text: "垂直均分",
        enable: selectedElementCount > 2,
        onTap: () {
          canvasDelegate?.canvasElementManager.averageElement(
              elementSelectComponent, CanvasAverageType.vertical);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.averageWidth),
        text: "等宽",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .averageElement(elementSelectComponent, CanvasAverageType.width);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.averageHeight),
        text: "等高",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .averageElement(elementSelectComponent, CanvasAverageType.height);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.averageSize),
        text: "等大小",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .averageElement(elementSelectComponent, CanvasAverageType.size);
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
