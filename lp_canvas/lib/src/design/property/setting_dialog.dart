import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/27
///
/// 画布设置对话框
class SettingDialog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final selectedElementCount =
        canvasDelegate?.canvasElementManager.selectedElementCount ?? 0;
    final elementSelectComponent =
        canvasDelegate?.canvasElementManager.elementSelectComponent;
    return [
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.setting),
        text: "设置",
        enable: selectedElementCount == 1,
        onTap: () {
          canvasDelegate?.canvasElementManager
              .showPropertyLayoutWidget(elementSelectComponent);
          checkClose(context);
        },
      ),
      IconTextTile(
        iconWidget: lpCanvasSvgWidget(Assets.svg.setting),
        text: "设置画布",
        enable: true,
        onTap: () {
          canvasDelegate?.canvasElementManager.showCanvasPropertyLayoutWidget();
          checkClose(context);
        },
      ),
    ].column();
  }

  void checkClose(BuildContext context) {
    if (closeAfterTap) {
      Navigator.of(context).pop();
    }
  }
}
