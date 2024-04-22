import 'package:gold_test/models/api/user/user_data.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_data_provider.g.dart';

@lazySingleton
@RestApi()
abstract class UserDataProvider {
  @factoryMethod
  factory UserDataProvider(Dio dio) = _UserDataProvider;

  @GET('/user')
  Future<UserData> getUser();
}
