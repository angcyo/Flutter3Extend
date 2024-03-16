part of 'canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///
/// 画布控制编辑属性设置小部件
///    ...快捷操作...
/// ...属性操作...
/// ...基础操作...
class CanvasDesignLayoutWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const CanvasDesignLayoutWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
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
          .wrapContent(
              alignment: AlignmentDirectional
                  .bottomEnd) /*.rowOf(null, mainAxisAlignment: MainAxisAlignment.end)!*/,
      //属性操作
      CanvasDesignBasicsLayoutWidget(canvasDelegate: canvasDelegate),
      //基础操作
      CanvasDesignBasicsLayoutWidget(canvasDelegate: canvasDelegate),
    ]
        .column(crossAxisAlignment: CrossAxisAlignment.start)!
        .matchParent(matchHeight: false);
  }
}

/// 画布底部的基础操作小部件
class CanvasDesignBasicsLayoutWidget extends StatefulWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const CanvasDesignBasicsLayoutWidget({super.key, this.canvasDelegate});

  @override
  State<CanvasDesignBasicsLayoutWidget> createState() =>
      _CanvasDesignBasicsLayoutWidgetState();
}

class _CanvasDesignBasicsLayoutWidgetState
    extends State<CanvasDesignBasicsLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return [
      AddPictureWidget(canvasDelegate: widget.canvasDelegate),
      AddTextWidget(canvasDelegate: widget.canvasDelegate),
      AddMaterialWidget(canvasDelegate: widget.canvasDelegate),
      AddShapeWidget(canvasDelegate: widget.canvasDelegate),
      AddGraffitiWidget(canvasDelegate: widget.canvasDelegate),
      CanvasEditTriggerWidget(canvasDelegate: widget.canvasDelegate),
      CanvasLayerTriggerWidget(canvasDelegate: widget.canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: widget.canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: widget.canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: widget.canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: widget.canvasDelegate),
      CanvasSettingTriggerWidget(canvasDelegate: widget.canvasDelegate),
    ]
        .scroll()!
        .container(color: const Color(0xFFF5F5F5))
        .matchParent(matchHeight: false);
  }
}
