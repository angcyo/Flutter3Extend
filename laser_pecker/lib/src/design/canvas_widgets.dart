part of '../../laser_pecker.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/13
///
/// 画布相关的小部件

const double kCanvasIcoItemRadiusSize = 8;

/// Canvas 基础操作小部件
class CanvasIcoWidget extends StatelessWidget {
  /// 正常颜色
  final Color? color;

  /// 禁用的颜色
  final Color? disableColor;

  /// 是否启用
  final bool enable;

  /// 图标
  final Widget? ico;

  /// 文本
  final Widget? text;

  /// 点击事件
  final GestureTapCallback? onTap;

  const CanvasIcoWidget({
    super.key,
    this.ico,
    this.text,
    this.color = Colors.black87,
    this.disableColor = Colors.black26,
    this.onTap,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return StateDecorationWidget(
      pressedDecoration: lineaGradientDecoration(
        listOf(Colors.blueAccent, Colors.greenAccent),
        borderRadius: kCanvasIcoItemRadiusSize,
      ),
      enablePressedDecoration: enable,
      child: [
        ico,
        text,
      ]
          .column()!
          .paddingSymmetric(vertical: 4, horizontal: 8)
          .colorFiltered(
              color: enable ? color : disableColor, blendMode: BlendMode.srcIn)
          .click(onTap, enable),
    );
  }
}

/// 撤销回退小部件
class CanvasUndoWidget extends StatefulWidget {
  final CanvasDelegate canvasDelegate;

  const CanvasUndoWidget({super.key, required this.canvasDelegate});

  @override
  State<CanvasUndoWidget> createState() => _CanvasUndoWidgetState();
}

class _CanvasUndoWidgetState extends State<CanvasUndoWidget> {
  late CanvasListener canvasListener = CanvasListener(
    onCanvasUndoChangedAction: (undoManager) {
      //debugger();
      updateState();
    },
  );

  @override
  void initState() {
    super.initState();
    widget.canvasDelegate.addCanvasListener(canvasListener);
  }

  @override
  void dispose() {
    widget.canvasDelegate.removeCanvasListener(canvasListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return [
      CanvasIcoWidget(
        enable: widget.canvasDelegate.canvasUndoManager.canUndo(),
        ico: lpSvgWidget(Assets.svg.undo),
        onTap: () {
          //debugger();
          widget.canvasDelegate.canvasUndoManager.undo();
        },
      ).tooltip("undo"),
      CanvasIcoWidget(
        enable: widget.canvasDelegate.canvasUndoManager.canRedo(),
        ico: lpSvgWidget(Assets.svg.redo),
        onTap: () {
          //debugger();
          widget.canvasDelegate.canvasUndoManager.redo();
        },
      ).tooltip("redo"),
    ].row()!;
  }
}
