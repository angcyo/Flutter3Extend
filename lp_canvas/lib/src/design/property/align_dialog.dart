part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/21
///

class AlignDialog extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AlignDialog(this.canvasDelegate, {super.key});

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
              .alignElement(elementSelectComponent, CanvasAlign.left);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignTop),
        text: "顶对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlign.top);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignRight),
        text: "右对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlign.right);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignBottom),
        text: "底对齐",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlign.bottom);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignHorizontal),
        text: "水平居中",
        onTap: () {
          canvasDelegate?.canvasElementManager.alignElement(
              elementSelectComponent, CanvasAlign.centerHorizontal);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignVertical),
        text: "垂直居中",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlign.centerVertical);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.alignCenter),
        text: "居中",
        onTap: () {
          canvasDelegate?.canvasElementManager
              .alignElement(elementSelectComponent, CanvasAlign.center);
        },
      ),
    ]
        .column()!
        .container(color: Colors.white)
        .matchParent(matchHeight: false)
        .align(Alignment.bottomCenter);
  }
}
