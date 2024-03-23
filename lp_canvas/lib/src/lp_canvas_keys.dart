part of '../lp_canvas.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///
/// 一些持久化的key
final class LpCanvasKeys {
  LpCanvasKeys._();

  /// 上一次的黑白阈值
  double get lastBWThreshold =>
      "lastBWThreshold".hiveGet() ?? LpConstants.defaultThreshold;

  set lastBWThreshold(double value) {
    "lastBWThreshold".hivePut(value);
  }

  /// 上一次的版画阈值
  double get lastPrintThreshold =>
      "lastPrintThreshold".hiveGet() ?? LpConstants.defaultThreshold;

  set lastPrintThreshold(double value) {
    "lastPrintThreshold".hivePut(value);
  }

  /// 上一次的印章阈值
  double get lastSealThreshold =>
      "lastSealThreshold".hiveGet() ?? LpConstants.defaultThreshold;

  set lastSealThreshold(double value) {
    "lastSealThreshold".hivePut(value);
  }

  /// 切片每一层下降的高度, 单位毫米
  @mm
  double get minSliceHeight => "minSliceHeight".hiveGet() ?? 0.1;

  set minSliceHeight(double value) {
    "minSliceHeight".hivePut(value);
  }
}

/// LpCanvasKey的实例
@globalInstance
final lpCanvasKeys = LpCanvasKeys._();
