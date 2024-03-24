import 'package:json_annotation/json_annotation.dart';

part 'variable_bean.g.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/03/23
///
/// 变量文本数据结构
@JsonSerializable()
class VariableBean {
  factory VariableBean.fromJson(Map<String, dynamic> json) =>
      _$VariableBeanFromJson(json);

  Map<String, dynamic> toJson() => _$VariableBeanToJson(this);

  VariableBean();
}
