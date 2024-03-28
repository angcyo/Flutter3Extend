part of 'canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/13
///
/// 画布相关的小部件

const double kCanvasIcoItemRadiusSize = 8;
const kCanvasItemMargin = EdgeInsets.symmetric(vertical: 4, horizontal: 4);
const kCanvasItemPadding = EdgeInsets.symmetric(vertical: 4, horizontal: 8);

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

  /// 长按提示文本
  final String? tooltip;

  /// 是否选中
  final bool isSelected;

  const CanvasIconWidget({
    super.key,
    this.canvasDelegate,
    this.icon,
    this.text,
    this.tip,
    this.tooltip,
    this.isSelected = false,
    this.color = Colors.black87,
    this.disableColor = Colors.black26,
    this.onTap,
    this.enable = true,
    this.tipAlignment = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context) {
    const padding = kCanvasItemPadding;
    const margin = kCanvasItemMargin;
    return IconStateWidget(
      icon: icon,
      text: text,
      tip: tip,
      tipAlignment: tipAlignment,
      enable: enable,
      color: color,
      disableColor: disableColor,
      padding: padding,
      onTap: onTap,
      tooltip: tooltip,
      pressedDecoration: lineaGradientDecoration(
        listOf(Colors.blueAccent, Colors.greenAccent),
        borderRadius: kCanvasIcoItemRadiusSize,
      ),
      selectedDecoration: isSelected
          ? lineaGradientDecoration(
              listOf(Colors.blueAccent, Colors.greenAccent),
              borderRadius: kCanvasIcoItemRadiusSize,
            )
          : null,
    ).paddingInsets(margin);
  }
}

/// 画布输入小部件
class CanvasNumberInputWidget extends StatelessWidget {
  /// 数值
  final num? number;
  final num? minNumber;
  final num? maxNumber;

  /// 格式化
  final NumFormat? numberFormat;

  /// 文本
  final Widget? text;

  /// 长按提示文本
  final String? tooltip;

  /// 输入提示文本
  final String? hintTooltip;

  /// 数值输入回调
  final NumberInputCallback? onNumberInput;

  const CanvasNumberInputWidget({
    super.key,
    this.number,
    this.numberFormat,
    this.text,
    this.tooltip,
    this.hintTooltip,
    this.minNumber,
    this.maxNumber,
    this.onNumberInput,
  });

  @override
  Widget build(BuildContext context) {
    const padding = kCanvasItemPadding;
    const margin = kCanvasItemMargin;
    return [
      StateDecorationWidget(
        decoration: fillDecoration(
          fillColor: Colors.black12,
          borderRadius: kCanvasIcoItemRadiusSize,
        ),
        pressedDecoration: fillDecoration(
          fillColor: Colors.black38,
          borderRadius: kCanvasIcoItemRadiusSize,
        ),
        enablePressedDecoration: number != null,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 60, minHeight: 26),
          child: (numberFormat?.call(number) ?? number?.toString())
              ?.text()
              .align(AlignmentDirectional.center),
        ),
      ).click(() async {
        final value = await showDialogWidget(
          context,
          NumberKeyboardDialog(
            number: number,
            minValue: minNumber,
            maxValue: maxNumber,
            hintText: hintTooltip ?? tooltip,
          ),
          type: TranslationType.translation,
          barrierDismissible: false,
        );
        onNumberInput?.call(value);
      }),
      text,
    ].column()!.paddingInsets(margin).tooltip(tooltip);
  }
}

/// 撤销回退小部件
class CanvasUndoWidget extends StatefulWidget {
  final CanvasDelegate? canvasDelegate;

  const CanvasUndoWidget(this.canvasDelegate, {super.key});

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
    widget.canvasDelegate?.addCanvasListener(canvasListener);
  }

  @override
  void dispose() {
    widget.canvasDelegate?.removeCanvasListener(canvasListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var undoManager = widget.canvasDelegate?.canvasUndoManager;
    return [
      CanvasIconWidget(
        enable: undoManager?.canUndo() == true,
        icon: lpCanvasSvgWidget(Assets.svg.canvasUndo),
        tip: isDebug
            ? Text(
                "${undoManager?.undoList.length}",
                style: const TextStyle(fontSize: 9),
              )
            : null,
        tipAlignment: Alignment.center,
        onTap: () {
          //debugger();
          undoManager?.undo();
        },
        tooltip: "undo",
      ),
      CanvasIconWidget(
        enable: undoManager?.canRedo() == true,
        icon: lpCanvasSvgWidget(Assets.svg.canvasRedo),
        tip: isDebug
            ? Text(
                "${undoManager?.redoList.length}",
                style: const TextStyle(fontSize: 9),
              )
            : null,
        tipAlignment: Alignment.center,
        onTap: () {
          //debugger();
          undoManager?.redo();
        },
        tooltip: "redo",
      ),
    ].row(mainAxisSize: MainAxisSize.min)!;
  }
}
