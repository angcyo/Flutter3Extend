part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///
/// 编辑属性触发小部件
class CanvasEditTriggerWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDesignLayoutController? layoutController;

  const CanvasEditTriggerWidget({super.key, this.layoutController});

  @override
  Widget build(BuildContext context) {
    const text = '编辑';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasBasicsEdit),
      tooltip: text,
      text: const Text(text),
      isSelected:
          layoutController?.isShowPropertyType(DesignShowPropertyType.edit) ==
              true,
      onTap: () {
        //widget.canvasDelegate?.undo();
        //toastInfo(text);
        layoutController
            ?.toggleShowPropertyTypeFrom(DesignShowPropertyType.edit);
      },
    );
  }
}

/// 图层触发小部件
class CanvasLayerTriggerWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const CanvasLayerTriggerWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '图层';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasBasicsLayer),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

/// 设置触发按钮
class CanvasSettingTriggerWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const CanvasSettingTriggerWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '设置';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.canvasBasicsSetting),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}
