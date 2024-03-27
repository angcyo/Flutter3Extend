import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/27
///
/// 画布设置对话框
class SettingDialog extends StatefulWidget {
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

class _SettingDialogState extends State<SettingDialog>
    with DialogMixin, TileMixin {
  @override
  Widget build(BuildContext context) {
    final canvasDelegate = widget.canvasDelegate;
    final axisUnit = canvasDelegate?.axisUnit;
    return buildBottomDialog(context, [
      IconTextTile(
        text: "Dp单位",
        rightWidget:
            buildSwitchWidget(context, axisUnit is DpUnit, onChanged: (value) {
          if (value) {
            canvasDelegate?.axisUnit = const DpUnit();
            updateState();
          }
        }),
        //enable: selectedElementCount == 1,
        onTap: () {
          /*canvasDelegate?.canvasElementManager
              .showPropertyLayoutWidget(elementSelectComponent);*/
          closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "厘米单位",
        rightWidget:
            buildSwitchWidget(context, axisUnit is MmUnit, onChanged: (value) {
          if (value) {
            canvasDelegate?.axisUnit = const MmUnit();
            updateState();
          }
        }),
        onTap: () {
          /*canvasDelegate?.canvasElementManager.showCanvasPropertyLayoutWidget();*/
          closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "英寸单位",
        rightWidget: buildSwitchWidget(context, axisUnit is InchUnit,
            onChanged: (value) {
          if (value) {
            canvasDelegate?.axisUnit = const InchUnit();
            updateState();
          }
        }),
        onTap: () {
          /*canvasDelegate?.canvasElementManager.showCanvasPropertyLayoutWidget();*/
          closeDialogIf(context, widget.closeAfterTap);
        },
      ),
      IconTextTile(
        text: "test",
        onTap: () {
          /*canvasDelegate?.canvasElementManager.showCanvasPropertyLayoutWidget();*/
          closeDialogIf(context, widget.closeAfterTap);
        },
      ),
    ]);
  }
}
