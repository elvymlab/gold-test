import 'package:gold_test/gateways/data_providers/authorization/authorization_data_provider.dart';
import 'package:gold_test/gateways/keepers/token_keeper.dart';
import 'package:gold_test/models/api/authorization/authorization_form_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthorizationCase {
  AuthorizationCase({
    required AuthorizationDataProvider provider,
    required TokensKeeper tokensKeeper,
  })  : _provider = provider,
        _tokensKeeper = tokensKeeper;

  final AuthorizationDataProvider _provider;
  final TokensKeeper _tokensKeeper;

  Future<String> run({
    required String login,
    required String password,
    required bool remember,
  }) async {
    _tokensKeeper.clear();
    final result = await _provider.authorize(
      params: AuthorizationFormData(
        login: login,
        password: password,
        remember: remember,
      ),
    );
    if (result.token != null) {
      _tokensKeeper.token = result.token;
    }
    return result.token ?? '';
  }
}
