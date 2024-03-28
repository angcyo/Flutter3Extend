library canvas_design;

import 'dart:developer';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

import '../../assets_generated/assets.gen.dart';
import '../../lp_canvas.dart';
import '../project/element/lp_image_element.dart';
import '../project/too_large_warn_dialog.dart';
import 'property/layer_dialog.dart';
import 'property/setting_dialog.dart';

part 'basics/basics_add_widgets.dart';
part 'basics/basics_widgets.dart';
part 'canvas_design_layout_controller.dart';
part 'canvas_widgets.dart';
part 'property/align_dialog.dart';
part 'property/arrange_dialog.dart';
part 'property/average_dialog.dart';
part 'property/basics_edit.dart';
part 'property/property_widgets.dart';

/// 画布设计中的竖线
const canvasDesignVerticalLine = Line(
  indent: 8,
  endIndent: 8,
  axis: Axis.vertical,
);

/// 默认的设计图标大小
const canvasDesignIconSize = 25.0;

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
        CanvasUndoWidget(canvasDelegate),
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
        child: CanvasDesignPropertyLayoutWidget(layoutController)
            .constrainedBox(constraint),
      ),
      //底部基础控制操作
      CanvasDesignBasicsLayoutWidget(layoutController)
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

  const CanvasDesignPropertyLayoutWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    final isSelectedGroupElement =
        canvasDelegate?.canvasElementManager.isSelectedGroupElement == true;
    //选中的元素
    final selectedElement =
        canvasDelegate?.canvasElementManager.selectedElement;

    //显示的属性类型
    final showPropertyType = layoutController?.showPropertyTypeValue.value;
    final isEditProperty = showPropertyType == DesignShowPropertyType.edit;
    final isShapeProperty = showPropertyType == DesignShowPropertyType.shape;

    //---
    WidgetList widgetList;
    if (isEditProperty) {
      widgetList = [
        if (isSelectedGroupElement)
          //group元素
          CanvasGroupEditWidget(layoutController),
        //竖线
        canvasDesignVerticalLine,
        //所有元素的基础操作
        CanvasBasicsEditWidget(layoutController),
      ];
    } else if (isShapeProperty) {
      widgetList = [
        ShapePropertyWidget(canvasDelegate),
      ];
    } else {
      widgetList = [
        CanvasBasicsEditWidget(layoutController),
      ];
    }

    return widgetList
        .scroll()!
        .container(color: const Color(0xFFFFFFFF))
        .matchParent(matchHeight: false);
  }
}

/// 画布底部的基础操作小部件
class CanvasDesignBasicsLayoutWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasDesignBasicsLayoutWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    final canvasDelegate = layoutController?.canvasDelegate;
    return [
      AddPictureWidget(canvasDelegate),
      AddTextWidget(canvasDelegate),
      AddMaterialWidget(canvasDelegate),
      AddShapeWidget(layoutController),
      AddGraffitiWidget(canvasDelegate),
      canvasDesignVerticalLine,
      CanvasEditTriggerWidget(layoutController),
      CanvasLayerTriggerWidget(canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate),
    ]
        .scroll()!
        .container(color: const Color(0xFFF5F5F5))
        .matchParent(matchHeight: false);
  }
}
