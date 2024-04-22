import 'package:json_annotation/json_annotation.dart';

part 'authorization_form_data.g.dart';

@JsonSerializable()
class AuthorizationFormData {
  AuthorizationFormData({
    required this.login,
    required this.password,
    required this.remember,
  });

  final String login;
  final String password;
  final bool remember;

  factory AuthorizationFormData.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFormDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorizationFormDataToJson(this);
}
