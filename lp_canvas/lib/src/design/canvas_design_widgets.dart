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

  /// 监听画布的变化
  late final CanvasListener listener = CanvasListener(
      onCanvasElementPropertyChangedAction: (element, from, to, propertyType) {
    updateState();
  }, onCanvasElementSelectChangedAction: (selectComponent, from, to) {
    if (isNullOrEmpty(to)) {
      //取消选中
      layoutController.hidePropertyLayoutWidget();
    } else {
      layoutController.toggleShowPropertyType(DesignShowPropertyType.edit);
    }
  });

  @override
  void initState() {
    widget.canvasDelegate?.addCanvasListener(listener);
    layoutController.showPropertyTypeValue
        .addListener(_handleShowPropertyTypeValueChange);
    super.initState();
  }

  @override
  void dispose() {
    widget.canvasDelegate?.removeCanvasListener(listener);
    layoutController.showPropertyTypeValue
        .removeListener(_handleShowPropertyTypeValueChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CanvasDesignLayoutWidget oldWidget) {
    //debugger();
    if (oldWidget.canvasDelegate != widget.canvasDelegate) {
      debugger();
      //oldWidget.canvasDelegate?.removeCanvasListener(listener);
      //widget.canvasDelegate?.addCanvasListener(listener);
    }
    super.didUpdateWidget(oldWidget);
  }

  /// 显示的属性类型改变
  void _handleShowPropertyTypeValueChange() {
    //debugger();
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = widget.canvasDelegate;

    const height = 65.0;
    const constraint = BoxConstraints(minHeight: height, maxHeight: height);
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
      //渐变阴影
      linearGradientWidget(
        [Colors.transparent, Colors.black12],
        height: 10,
        gradientDirection: Axis.vertical,
      ),
      //属性操作
      SizeAnimationWidget(
        enableHeightAnimation: true,
        controller: layoutController.propertyLayoutController,
        child:
            CanvasDesignPropertyLayoutWidget(layoutController: layoutController)
                .constrainedBox(constraint),
      ),
      //控制操作
      CanvasDesignBasicsLayoutWidget(layoutController: layoutController)
          .constrainedBox(constraint),
    ]
        .column(crossAxisAlignment: CrossAxisAlignment.start)!
        .matchParent(matchHeight: false);
  }
}

/// 属性编辑操作小部件
class CanvasDesignPropertyLayoutWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasDesignPropertyLayoutWidget({super.key, this.layoutController});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      const Line(
        indent: 8,
        endIndent: 8,
        axis: Axis.vertical,
      ),
      CanvasBasicsEditWidget(layoutController: layoutController),
    ]
        .scroll()!
        .container(color: const Color(0xFFFFFFFF))
        .matchParent(matchHeight: false);
  }
}

/// 画布底部的基础操作小部件
class CanvasDesignBasicsLayoutWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasDesignBasicsLayoutWidget({super.key, this.layoutController});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      AddPictureWidget(canvasDelegate: canvasDelegate),
      AddTextWidget(canvasDelegate: canvasDelegate),
      AddMaterialWidget(canvasDelegate: canvasDelegate),
      AddShapeWidget(layoutController: layoutController),
      AddGraffitiWidget(canvasDelegate: canvasDelegate),
      const Line(
        indent: 8,
        endIndent: 8,
        axis: Axis.vertical,
      ),
      CanvasEditTriggerWidget(layoutController: layoutController),
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
