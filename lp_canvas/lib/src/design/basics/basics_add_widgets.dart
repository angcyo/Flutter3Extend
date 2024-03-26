part of '../canvas_design.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///
/// 添加图片小部件
class AddPictureWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddPictureWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '相册';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.addPicture),
      tooltip: text,
      text: const Text(text),
      onTap: () async {
        final result = await pickFiles();
        result?.paths.forEach((element) async {
          l.d('element:$element');
          final image = await element?.toImageFromFile();
          final imageElement = LpImageElement();
          final bean = LpProject.createImageBean(image: image);
          imageElement.elementBean = bean;
          imageElement.updatePropertyFromBean();
          imageElement.originImage = image;
          imageElement.paintImage = image;
          canvasDelegate?.canvasElementManager
              .addElement(imageElement, selected: true);
          //final base64 = await image?.toBase64();
          //debugger();
        });
      },
    );
  }
}

/// 添加文本小部件
class AddTextWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddTextWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '文本';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.addText),
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

  const AddMaterialWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '素材';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.addMaterial),
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
  final CanvasDesignLayoutController? layoutController;

  const AddShapeWidget(this.layoutController, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '形状';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.addShape),
      tooltip: text,
      text: const Text(text),
      isSelected:
          layoutController?.isShowPropertyType(DesignShowPropertyType.shape) ==
              true,
      onTap: () {
        //widget.canvasDelegate?.undo();
        layoutController
            ?.toggleShowPropertyTypeFrom(DesignShowPropertyType.shape);
      },
    );
  }
}

/// 添加涂鸦小部件
class AddGraffitiWidget extends StatelessWidget {
  /// 核心对象
  final CanvasDelegate? canvasDelegate;

  const AddGraffitiWidget(this.canvasDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    const text = '涂鸦';
    return CanvasIconWidget(
      icon: lpCanvasSvgWidget(Assets.svg.addGraffiti),
      tooltip: text,
      text: const Text(text),
      onTap: () {
        //widget.canvasDelegate?.undo();
        toastInfo(text);
      },
    );
  }
}
