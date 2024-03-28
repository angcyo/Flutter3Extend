import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/27
///
/// 画布设置对话框
class SettingDialog extends StatefulWidget with DialogMixin {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  /// 点击后, 关闭对话框
  final bool closeAfterTap;

  const SettingDialog(
    this.canvasDelegate, {
    super.key,
    this.closeAfterTap = true,
  });

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> with TileMixin {
  @override
  Widget build(BuildContext context) {
    final canvasDelegate = widget.canvasDelegate;
    final axisUnit = canvasDelegate?.axisUnit;
    return widget.buildBottomDialog(context, [
      IconTextTile(
        text: "厘米单位",
        rightWidget: buildSwitchWidget(
          context,
          axisUnit is MmUnit,
          onChanged: (value) {
            if (value) {
              canvasDelegate?.axisUnit = const MmUnit();
              updateState();
            }
          },
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "英寸单位",
        rightWidget: buildSwitchWidget(
          context,
          axisUnit is InchUnit,
          onChanged: (value) {
            if (value) {
              canvasDelegate?.axisUnit = const InchUnit();
              updateState();
            }
          },
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "像素单位",
        rightWidget: buildSwitchWidget(
          context,
          axisUnit is PixelUnit,
          onChanged: (value) {
            if (value) {
              canvasDelegate?.axisUnit = const PixelUnit();
              updateState();
            }
          },
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "Dp单位",
        rightWidget: buildSwitchWidget(
          context,
          axisUnit is DpUnit,
          onChanged: (value) {
            if (value) {
              canvasDelegate?.axisUnit = const DpUnit();
              updateState();
            }
          },
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "Pt单位",
        rightWidget: buildSwitchWidget(
          context,
          axisUnit is PtUnit,
          onChanged: (value) {
            if (value) {
              canvasDelegate?.axisUnit = const PtUnit();
              updateState();
            }
          },
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "网格",
        rightWidget: buildSwitchWidget(
          context,
          canvasDelegate?.canvasPaintManager.axisManager.showGrid == true,
          onChanged: (value) {
            canvasDelegate?.canvasPaintManager.axisManager.showGrid = value;
            updateState();
          },
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "智能指南",
        rightWidget: buildSwitchWidget(
          context,
          false,
          onChanged: (value) {},
        ),
        onTap: () {
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "...",
        onTap: () {
          /*canvasDelegate?.canvasElementManager.showCanvasPropertyLayoutWidget();*/
          widget.closeDialogIf(context, widget.closeAfterTap);
        },
      ),
    ]);
  }
}
