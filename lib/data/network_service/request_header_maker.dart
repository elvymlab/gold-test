import 'package:gold_test/gateways/keepers/token_keeper.dart';
import 'package:injectable/injectable.dart';
import 'consts.dart';

@lazySingleton
class RequestHeaderMaker {
  RequestHeaderMaker({
    required TokensKeeper tokensKeeper,
  }) : _tokensKeeper = tokensKeeper;

  final TokensKeeper _tokensKeeper;

  Map<String, String> make() {
    final headers = <String, String>{};
    final token = _tokensKeeper.token;
    if (token != null) {
      headers[authorizationKey] = 'Bearer $token';
    }
    return headers;
  }
}
