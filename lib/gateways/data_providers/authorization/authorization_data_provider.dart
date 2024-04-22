import 'package:gold_test/models/api/authorization/authorization_form_data.dart';
import 'package:gold_test/models/api/token/token_data.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'authorization_data_provider.g.dart';

@lazySingleton
@RestApi()
abstract class AuthorizationDataProvider {
  @factoryMethod
  factory AuthorizationDataProvider(Dio dio) = _AuthorizationDataProvider;

  @POST('/login')
  Future<TokenData> authorize({
    @Body() required AuthorizationFormData params,
  });
}
