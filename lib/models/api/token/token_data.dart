import 'package:json_annotation/json_annotation.dart';

part 'token_data.g.dart';

@JsonSerializable()
class TokenData {
  TokenData({this.token});

  final String? token;

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}
