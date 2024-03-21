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
    const String text = "左对齐" ;
    return [
      IconTextTile(
        icon: Icons.align_horizontal_left,
        iconWidget: null,
        text: text ,
      ),
      /*CanvasIconWidget(
        icon: lpCanvasSvgWidget(Assets.svg.canvasAverage),
        tooltip: text,
        text: const Text(text),
        onTap: () {
          //widget.canvasDelegate?.undo();
          toastInfo(text);
        },
      ),*/
    ]
        .column()!
        .container(color: Colors.white)
        .matchParent(matchHeight: false)
        .align(Alignment.bottomCenter);
  }
}
