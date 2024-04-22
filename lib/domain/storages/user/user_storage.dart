import 'package:flutter/material.dart';
import 'package:gold_test/gateways/keepers/token_keeper.dart';
import 'package:gold_test/models/entities/user/user_state.dart';
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart';
import 'package:gold_test/presentation/navigation/routes/authorize_routes.dart';

/// Модель пользователя на базе [ChangeNotifier]. Занимается хранением статуса пользовательской
/// сессии - [UserState].

class UserStorage extends ChangeNotifier {
  UserStorage({
    required TokensKeeper tokensKeeper,
    required AppNavigator navigator,
  })  : _tokensKeeper = tokensKeeper,
        _navigator = navigator {
    _updateStateIfNeed();
  }

  final TokensKeeper _tokensKeeper;
  final AppNavigator _navigator;

  UserState _state = UserState.unknown;

  UserState get state => _state;

  Future<void> startLogin() async {
    try {
      _tokensKeeper.clear();
      final result = await _navigator.pushRoute(LoginRoute());
      if (result is String) {
        _updateStateIfNeed();
      }
    } catch (_) {}
  }

  Future<void> logout() async {
    _tokensKeeper.token = null;
    _tokensKeeper.clear();
    _updateStateIfNeed();
    notifyListeners();
  }

  void _updateStateIfNeed() async {
    final newState = _generateUserState();
    if (newState != _state) {
      _state = newState;
      notifyListeners();
    }
  }

  UserState _generateUserState() {
    if (_tokensKeeper.token == null) {
      return UserState.guest;
    }
    return UserState.authorized;
  }
}
