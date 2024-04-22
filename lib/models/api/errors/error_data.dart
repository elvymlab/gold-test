import 'package:json_annotation/json_annotation.dart';

part 'error_data.g.dart';

@JsonSerializable()
class ErrorData {
  ErrorData({this.message});

  final String? message;

  factory ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
