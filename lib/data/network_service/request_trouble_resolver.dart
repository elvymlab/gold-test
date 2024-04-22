import 'dart:async';
import 'package:gold_test/data/network_service/authorization_trouble_resolver.dart';
import 'package:gold_test/gateways/keepers/token_keeper.dart';
import 'package:gold_test/models/entities/errors/network_error.dart';

class RequestTroubleHandler {
  RequestTroubleHandler({
    required AuthorizationTroubleResolver authorizationTroubleResolver,
    required TokensKeeper tokensKeeper,
  })  : _tokensKeeper = tokensKeeper,
        _authorizationTroubleResolver = authorizationTroubleResolver;

  final AuthorizationTroubleResolver _authorizationTroubleResolver;
  final TokensKeeper _tokensKeeper;

  Future<bool> tryResolve(NetworkError error) async {
    try {
      if (error is AuthorizationNetworkError) {
        if (_tokensKeeper.token == null) {
          return _authorizationTroubleResolver.resolve();
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
