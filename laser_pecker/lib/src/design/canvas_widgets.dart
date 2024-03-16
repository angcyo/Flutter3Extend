part of '../../laser_pecker.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/13
///
/// 画布相关的小部件

const double kCanvasIcoItemRadiusSize = 8;

/// Canvas 基础操作小部件
class CanvasIconWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  /// 正常颜色
  final Color? color;

  /// 禁用的颜色
  final Color? disableColor;

  /// 是否启用
  final bool enable;

  /// 图标
  final Widget? icon;

  /// 文本
  final Widget? text;

  /// 提示信息
  final Widget? tip;

  /// 提示信息的位置
  final AlignmentGeometry tipAlignment;

  /// 点击事件
  final GestureTapCallback? onTap;

  const CanvasIconWidget({
    super.key,
    this.canvasDelegate,
    this.icon,
    this.text,
    this.tip,
    this.color = Colors.black87,
    this.disableColor = Colors.black26,
    this.onTap,
    this.enable = true,
    this.tipAlignment = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context) {
    return IconStateWidget(
      icon: icon,
      text: text,
      tip: tip,
      tipAlignment: tipAlignment,
      enable: enable,
      color: color,
      disableColor: disableColor,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      onTap: onTap,
      pressedDecoration: lineaGradientDecoration(
        listOf(Colors.blueAccent, Colors.greenAccent),
        borderRadius: kCanvasIcoItemRadiusSize,
      ),
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
      CanvasIconWidget(
        enable: widget.canvasDelegate.canvasUndoManager.canUndo(),
        icon: lpSvgWidget(Assets.svg.undo),
        tip: isDebug
            ? Text(
                "${widget.canvasDelegate.canvasUndoManager.undoList.length}",
                style: const TextStyle(fontSize: 9),
              )
            : null,
        tipAlignment: Alignment.center,
        onTap: () {
          //debugger();
          widget.canvasDelegate.canvasUndoManager.undo();
        },
      ).tooltip("undo"),
      CanvasIconWidget(
        enable: widget.canvasDelegate.canvasUndoManager.canRedo(),
        icon: lpSvgWidget(Assets.svg.redo),
        tip: isDebug
            ? Text(
                "${widget.canvasDelegate.canvasUndoManager.redoList.length}",
                style: const TextStyle(fontSize: 9),
              )
            : null,
        tipAlignment: Alignment.center,
        onTap: () {
          //debugger();
          widget.canvasDelegate.canvasUndoManager.redo();
        },
      ).tooltip("redo"),
    ].row()!;
  }
}
