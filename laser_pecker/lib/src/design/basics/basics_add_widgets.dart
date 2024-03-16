part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///
/// 添加图片小部件
class AddPictureWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddPictureWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '相册';
    return CanvasIconWidget(
      icon: lpSvgWidget(Assets.svg.addPicture),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

/// 添加文本小部件
class AddTextWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddTextWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '文本';
    return CanvasIconWidget(
      icon: lpSvgWidget(Assets.svg.addText),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

/// 添加素材小部件
class AddMaterialWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddMaterialWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '素材';
    return CanvasIconWidget(
      icon: lpSvgWidget(Assets.svg.addMaterial),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

/// 添加形状小部件
class AddShapeWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddShapeWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '形状';
    return CanvasIconWidget(
      icon: lpSvgWidget(Assets.svg.addShape),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}

/// 添加涂鸦小部件
class AddGraffitiWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddGraffitiWidget({super.key, this.canvasDelegate});

  @override
  Widget build(BuildContext context) {
    const text = '涂鸦';
    return CanvasIconWidget(
      icon: lpSvgWidget(Assets.svg.addGraffiti),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}
