part of 'canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///
/// 画布控制编辑属性设置小部件
///    ...快捷操作...
/// ...属性操作...
/// ...基础操作...
class CanvasDesignLayoutWidget extends StatefulWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const CanvasDesignLayoutWidget({
    super.key,
    this.canvasDelegate,
  });

  @override
  State<CanvasDesignLayoutWidget> createState() =>
      _CanvasDesignLayoutWidgetState();
}

class _CanvasDesignLayoutWidgetState extends State<CanvasDesignLayoutWidget>
    with SingleTickerProviderStateMixin {
  late final CanvasDesignLayoutController layoutController =
      CanvasDesignLayoutController(
          vsync: this, canvasDelegate: widget.canvasDelegate);

  @override
  void initState() {
    layoutController.showPropertyTypeValue
        .addListener(_handleShowPropertyTypeValueChange);
    super.initState();
  }

  /// 显示的属性类型改变
  void _handleShowPropertyTypeValueChange() {
    //debugger();
    updateState();
  }

  @override
  void dispose() {
    layoutController.showPropertyTypeValue
        .removeListener(_handleShowPropertyTypeValueChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = widget.canvasDelegate;
    return [
      //快捷操作
      [
        CanvasUndoWidget(canvasDelegate: canvasDelegate),
      ]
          .row(mainAxisSize: MainAxisSize.min)!
          .radiusShadow(
            color: Colors.white,
            radius: kCanvasIcoItemRadiusSize,
          )
          .paddingAll(8)
          .wrapContent(alignment: AlignmentDirectional.bottomEnd),
      //属性操作
      SizeAnimationWidget(
        enableHeightAnimation: true,
        controller: layoutController.propertyLayoutController,
        child:
            CanvasDesignBasicsLayoutWidget(layoutController: layoutController),
      ),
      //基础操作
      CanvasDesignBasicsLayoutWidget(layoutController: layoutController),
    ]
        .column(crossAxisAlignment: CrossAxisAlignment.start)!
        .matchParent(matchHeight: false);
  }
}

/// 画布底部的基础操作小部件
class CanvasDesignBasicsLayoutWidget extends StatefulWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasDesignBasicsLayoutWidget({super.key, this.layoutController});

  @override
  State<CanvasDesignBasicsLayoutWidget> createState() =>
      _CanvasDesignBasicsLayoutWidgetState();
}

class _CanvasDesignBasicsLayoutWidgetState
    extends State<CanvasDesignBasicsLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    final canvasDelegate = widget.layoutController?.canvasDelegate;
    return [
      AddPictureWidget(canvasDelegate: canvasDelegate),
      AddTextWidget(canvasDelegate: canvasDelegate),
      AddMaterialWidget(canvasDelegate: canvasDelegate),
      AddShapeWidget(layoutController: widget.layoutController),
      AddGraffitiWidget(canvasDelegate: canvasDelegate),
      const Line(
        indent: 8,
        endIndent: 8,
        axis: Axis.vertical,
      ),
      CanvasEditTriggerWidget(layoutController: widget.layoutController),
      CanvasLayerTriggerWidget(canvasDelegate: canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: canvasDelegate),
    ]
        .scroll()!
        .container(color: const Color(0xFFF5F5F5))
        .matchParent(matchHeight: false);
  }
}
