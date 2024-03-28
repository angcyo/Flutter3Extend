import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/28
///
/// 图层对话框, 用来显示当前画布中的所有元素
class LayerDialog extends StatefulWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const LayerDialog(this.canvasDelegate, {super.key});

  @override
  State<LayerDialog> createState() => _LayerDialogState();
}

class _LayerDialogState extends State<LayerDialog> with AbsScrollPage {
  @override
  Widget build(BuildContext context) {
    final elements = widget.canvasDelegate?.canvasElementManager.elements ?? [];
    return buildScaffold(context, children: [
      for (final element in elements) CanvasElementWidget(element),
    ]);
  }
}
