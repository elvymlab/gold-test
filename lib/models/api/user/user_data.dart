import 'package:gold_test/models/entities/errors/mapping_error.dart';
import 'package:gold_test/models/entities/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData({
    this.name,
    this.division,
    this.post,
  });

  final String? name;
  final String? division;
  final String? post;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  User toDomain() {
    final name = this.name;
    if (name == null) {
      throw MapToDomainModelError('Обязательные аргументы отсутствуют');
    }
    return User(
      name: name,
      division: division,
      post: post,
    );
  }
}
