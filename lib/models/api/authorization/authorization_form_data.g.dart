// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationFormData _$AuthorizationFormDataFromJson(
        Map<String, dynamic> json) =>
    AuthorizationFormData(
      login: json['login'] as String,
      password: json['password'] as String,
      remember: json['remember'] as bool,
    );

Map<String, dynamic> _$AuthorizationFormDataToJson(
        AuthorizationFormData instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'remember': instance.remember,
    };
