// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementBean _$ElementBeanFromJson(Map<String, dynamic> json) => ElementBean()
  ..left = (json['left'] as num?)?.toDouble()
  ..top = (json['top'] as num?)?.toDouble()
  ..width = (json['width'] as num?)?.toDouble()
  ..height = (json['height'] as num?)?.toDouble()
  ..angle = (json['angle'] as num?)?.toDouble()
  ..scaleX = (json['scaleX'] as num?)?.toDouble()
  ..scaleY = (json['scaleY'] as num?)?.toDouble()
  ..flipX = json['flipX'] as bool
  ..flipY = json['flipY'] as bool
  ..skewX = (json['skewX'] as num?)?.toDouble()
  ..skewY = (json['skewY'] as num?)?.toDouble()
  ..id = json['id'] as int
  ..uuid = json['uuid'] as String?
  ..icon = json['icon'] as String?
  ..mtype = json['mtype'] as int
  ..name = json['name'] as String?
  ..groupId = json['groupId'] as String?
  ..groupName = json['groupName'] as String?
  ..fill = json['fill'] as String?
  ..stroke = json['stroke'] as String?
  ..paintStyle = json['paintStyle'] as int
  ..data = json['data'] as String?
  ..dataUri = json['dataUri'] as String?
  ..isVisible = json['isVisible'] as bool
  ..isLock = json['isLock'] as bool
  ..text = json['text'] as String?
  ..coding = json['coding'] as String?
  ..eclevel = json['eclevel'] as String?
  ..qrMaskPattern = json['qrMaskPattern'] as int?
  ..errorLevel = json['errorLevel'] as int?
  ..textShowStyle = json['textShowStyle'] as String?
  ..textAlign = json['textAlign'] as String?
  ..fontSize = (json['fontSize'] as num).toDouble()
  ..charSpacing = (json['charSpacing'] as num).toDouble()
  ..lineSpacing = (json['lineSpacing'] as num).toDouble()
  ..fontFamily = json['fontFamily'] as String?
  ..fontUri = json['fontUri'] as String?
  ..fontWeight = json['fontWeight'] as bool
  ..fontStyle = json['fontStyle'] as bool
  ..underline = json['underline'] as bool
  ..linethrough = json['linethrough'] as bool
  ..orientation = json['orientation'] as int
  ..isCompactText = json['isCompactText'] as bool
  ..textColor = json['textColor'] as String?
  ..curvature = (json['curvature'] as num).toDouble()
  ..variables = (json['variables'] as List<dynamic>?)
      ?.map((e) => VariableBean.fromJson(e as Map<String, dynamic>))
      .toList()
  ..rx = (json['rx'] as num).toDouble()
  ..ry = (json['ry'] as num).toDouble()
  ..side = json['side'] as int
  ..depth = json['depth'] as int
  ..path = json['path'] as String?
  ..dashWidth = (json['dashWidth'] as num).toDouble()
  ..dashGap = (json['dashGap'] as num).toDouble()
  ..imageOriginal = json['imageOriginal'] as String?
  ..imageOriginalUri = json['imageOriginalUri'] as String?
  ..src = json['src'] as String?
  ..srcUri = json['srcUri'] as String?
  ..imageFilter = json['imageFilter'] as int
  ..contrast = (json['contrast'] as num).toDouble()
  ..brightness = (json['brightness'] as num).toDouble()
  ..blackThreshold = (json['blackThreshold'] as num).toDouble()
  ..sealThreshold = (json['sealThreshold'] as num).toDouble()
  ..printsThreshold = (json['printsThreshold'] as num).toDouble()
  ..inverse = json['inverse'] as bool
  ..gcodeLineSpace = (json['gcodeLineSpace'] as num).toDouble()
  ..gcodeAngle = (json['gcodeAngle'] as num).toDouble()
  ..gcodeOutline = json['gcodeOutline'] as bool
  ..gcodeFillStep = (json['gcodeFillStep'] as num).toDouble()
  ..gcodeFillAngle = (json['gcodeFillAngle'] as num).toDouble()
  ..isMesh = json['isMesh'] as bool
  ..minDiameter = (json['minDiameter'] as num?)?.toDouble()
  ..maxDiameter = (json['maxDiameter'] as num?)?.toDouble()
  ..meshShape = json['meshShape'] as String?
  ..sliceCount = json['sliceCount'] as int
  ..sliceHeight = (json['sliceHeight'] as num).toDouble()
  ..reliefStrength = json['reliefStrength'] as int
  ..index = json['index'] as int?
  ..lightSource = json['lightSource'] as int?
  ..precision = json['precision'] as int?
  ..printCount = json['printCount'] as int?
  ..printDepth = json['printDepth'] as int?
  ..printPower = json['printPower'] as int?
  ..dpi = (json['dpi'] as num?)?.toDouble()
  ..pump = json['pump'] as int?
  ..materialCode = json['materialCode'] as String?
  ..materialKey = json['materialKey'] as String?
  ..materialName = json['materialName'] as String?
  ..materialId = json['materialId'] as String?
  ..bigSpeed = json['bigSpeed'] as int?
  ..useLaserFrequency = json['useLaserFrequency'] as bool
  ..laserFrequency = json['laserFrequency'] as int?
  ..isCut = json['isCut'] as bool;

Map<String, dynamic> _$ElementBeanToJson(ElementBean instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'width': instance.width,
      'height': instance.height,
      'angle': instance.angle,
      'scaleX': instance.scaleX,
      'scaleY': instance.scaleY,
      'flipX': instance.flipX,
      'flipY': instance.flipY,
      'skewX': instance.skewX,
      'skewY': instance.skewY,
      'id': instance.id,
      'uuid': instance.uuid,
      'icon': instance.icon,
      'mtype': instance.mtype,
      'name': instance.name,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'fill': instance.fill,
      'stroke': instance.stroke,
      'paintStyle': instance.paintStyle,
      'data': instance.data,
      'dataUri': instance.dataUri,
      'isVisible': instance.isVisible,
      'isLock': instance.isLock,
      'text': instance.text,
      'coding': instance.coding,
      'eclevel': instance.eclevel,
      'qrMaskPattern': instance.qrMaskPattern,
      'errorLevel': instance.errorLevel,
      'textShowStyle': instance.textShowStyle,
      'textAlign': instance.textAlign,
      'fontSize': instance.fontSize,
      'charSpacing': instance.charSpacing,
      'lineSpacing': instance.lineSpacing,
      'fontFamily': instance.fontFamily,
      'fontUri': instance.fontUri,
      'fontWeight': instance.fontWeight,
      'fontStyle': instance.fontStyle,
      'underline': instance.underline,
      'linethrough': instance.linethrough,
      'orientation': instance.orientation,
      'isCompactText': instance.isCompactText,
      'textColor': instance.textColor,
      'curvature': instance.curvature,
      'variables': instance.variables,
      'rx': instance.rx,
      'ry': instance.ry,
      'side': instance.side,
      'depth': instance.depth,
      'path': instance.path,
      'dashWidth': instance.dashWidth,
      'dashGap': instance.dashGap,
      'imageOriginal': instance.imageOriginal,
      'imageOriginalUri': instance.imageOriginalUri,
      'src': instance.src,
      'srcUri': instance.srcUri,
      'imageFilter': instance.imageFilter,
      'contrast': instance.contrast,
      'brightness': instance.brightness,
      'blackThreshold': instance.blackThreshold,
      'sealThreshold': instance.sealThreshold,
      'printsThreshold': instance.printsThreshold,
      'inverse': instance.inverse,
      'gcodeLineSpace': instance.gcodeLineSpace,
      'gcodeAngle': instance.gcodeAngle,
      'gcodeOutline': instance.gcodeOutline,
      'gcodeFillStep': instance.gcodeFillStep,
      'gcodeFillAngle': instance.gcodeFillAngle,
      'isMesh': instance.isMesh,
      'minDiameter': instance.minDiameter,
      'maxDiameter': instance.maxDiameter,
      'meshShape': instance.meshShape,
      'sliceCount': instance.sliceCount,
      'sliceHeight': instance.sliceHeight,
      'reliefStrength': instance.reliefStrength,
      'index': instance.index,
      'lightSource': instance.lightSource,
      'precision': instance.precision,
      'printCount': instance.printCount,
      'printDepth': instance.printDepth,
      'printPower': instance.printPower,
      'dpi': instance.dpi,
      'pump': instance.pump,
      'materialCode': instance.materialCode,
      'materialKey': instance.materialKey,
      'materialName': instance.materialName,
      'materialId': instance.materialId,
      'bigSpeed': instance.bigSpeed,
      'useLaserFrequency': instance.useLaserFrequency,
      'laserFrequency': instance.laserFrequency,
      'isCut': instance.isCut,
    };
