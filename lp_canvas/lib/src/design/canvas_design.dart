library canvas_design;

import 'dart:developer';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/16
///

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

import '../../assets_generated/assets.gen.dart';
import '../../lp_canvas.dart';

part 'basics/basics_add_widgets.dart';
part 'basics/basics_widgets.dart';
part 'canvas_design_layout_controller.dart';
part 'canvas_design_widgets.dart';
part 'canvas_widgets.dart';
part 'property/basics_edit.dart';
part 'property/property_widgets.dart';

/// 画布设计中的竖线
const canvasDesignVerticalLine = Line(
  indent: 8,
  endIndent: 8,
  axis: Axis.vertical,
);

/// 默认的设计图标大小
const canvasDesignIconSize = 25.0;
