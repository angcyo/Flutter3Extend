part of 'canvas_design.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/17
///
/// 画布底部小部件/和属性小部件控制器
class CanvasDesignLayoutController {
  final CanvasDelegate? canvasDelegate;
  final TickerProvider vsync;

  CanvasDesignLayoutController({required this.vsync, this.canvasDelegate});

  //region ---元素---

  /// 是否选中了元素
  bool get isSelectedElement =>
      canvasDelegate?.canvasElementManager.isSelectedElement == true;

  /// 选中的元素
  ElementPainter? get selectedElement =>
      canvasDelegate?.canvasElementManager.selectedElement;

  //endregion ---元素---

  //region ---属性控制小部件---

  /// 当前显示了什么类型的属性
  ValueNotifier<DesignShowPropertyType> showPropertyTypeValue =
      ValueNotifier(DesignShowPropertyType.none);

  /// 动画控制
  late final AnimationController propertyLayoutController = AnimationController(
    vsync: vsync,
    value: 0 /*默认不可见*/,
    duration: const Duration(milliseconds: 300),
  );

  /// 属性布局是否显示了
  bool get isShowPropertyLayout => propertyLayoutController.value > 0;

  /// 是否显示了指定类型的属性布局
  bool isShowPropertyType(DesignShowPropertyType type) =>
      showPropertyTypeValue.value == type;

  /// 点击任意按钮切换显示属性布局的状态
  void toggleShowPropertyTypeFrom([DesignShowPropertyType? type]) {
    //debugger();
    if (type == DesignShowPropertyType.edit) {
      //来自编辑按钮触发的方法
      if (isShowPropertyLayout &&
          showPropertyTypeValue.value == DesignShowPropertyType.edit) {
        //已经是编辑属性布局
        hidePropertyLayoutWidget();
      } else {
        toggleShowPropertyType(DesignShowPropertyType.edit);
      }
    } else {
      if (isShowPropertyLayout && showPropertyTypeValue.value == type) {
        //已显示了相同类型的属性布局, 则自动切换至edit或hide
        toggleShowPropertyType();
      } else {
        //否则直接显示到对应属性布局
        toggleShowPropertyType(type);
      }
    }
  }

  /// 切换显示属性控制小部件布局类型
  /// [type] 为null, 则自动决定是否隐藏布局
  /// [type] 为[DesignShowPropertyType.none]时则强制隐藏布局
  void toggleShowPropertyType([DesignShowPropertyType? type]) {
    type ??= isSelectedElement
        ? DesignShowPropertyType.edit
        : DesignShowPropertyType.none;

    if (type == DesignShowPropertyType.none) {
      //隐藏
      hidePropertyLayoutWidget();
    } else {
      //显示
      if (!isShowPropertyLayout) {
        showPropertyLayoutWidget();
      }
    }
    showPropertyTypeValue.value = type;
  }

  /// 显示属性控制小部件布局
  void showPropertyLayoutWidget() {
    propertyLayoutController.forward();
  }

  /// 隐藏属性控制小部件布局
  void hidePropertyLayoutWidget() {
    propertyLayoutController.reverse();
    showPropertyTypeValue.value = DesignShowPropertyType.none;
  }

//endregion ---属性控制小部件---
}

/// 画布属性显示类型, 当前显示了什么类型的属性
enum DesignShowPropertyType {
  /// 无
  none,

  /// 编辑属性, 编辑属性里面包含对应的元素属性和基础属性编辑
  edit,

  /// 形状属性
  shape,
}
