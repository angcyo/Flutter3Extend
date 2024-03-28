import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/28
///
/// 打开大尺寸文件警告对话框
class TooLargeWarnDialog extends StatelessWidget with DialogMixin {
  final ValueCallback? onScaleAction;

  const TooLargeWarnDialog(this.onScaleAction, {super.key});

  @override
  TranslationType get translationType => TranslationType.scaleFade;

  @override
  Widget build(BuildContext context) {
    return buildCenterDialog(
        context,
        [
          "导入的图片尺寸过大, 是否缩放显示?".text().paddingSymmetric(vertical: kX),
          GradientButton(
            onTap: () {
              onScaleAction?.call(true);
              closeDialogIf(context);
            },
            child: "缩放显示".text(),
          ).matchParentWidth(),
          GradientButton.stroke(
            onTap: () {
              onScaleAction?.call(false);
              closeDialogIf(context);
            },
            child: "原始尺寸显示".text(),
          ).matchParentWidth(),
        ].column(gap: kX)!);
  }
}
