import 'package:flutter/cupertino.dart';
import 'package:gold_test/domain/mixins/loading_state_switch_mixin.dart';
import 'package:gold_test/domain/storages/user/user_storage.dart';
import 'package:gold_test/domain/use_cases/user/fetch_user_case.dart';
import 'package:gold_test/models/entities/user/user.dart';
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart';
import 'package:gold_test/presentation/navigation/routes/authorize_routes.dart';
import 'dart:developer' as dev;

import 'package:injectable/injectable.dart';

@injectable
class HomeScreenState extends ChangeNotifier with LoadingStateSwitch {
  HomeScreenState({
    required FetchUserCase fetchUserCase,
    required UserStorage userStorage,
    required AppNavigator appNavigator,
  })  : _fetchUserCase = fetchUserCase,
        _userStorage = userStorage,
        _appNavigator = appNavigator {
    refresh();
  }

  final FetchUserCase _fetchUserCase;
  final UserStorage _userStorage;
  final AppNavigator _appNavigator;
  User? _user;

  User? get user => _user;

  Future<void> refresh() async {
    await _fetchUser();
  }

  void logout() {
    _userStorage.logout();
    _appNavigator.pushRoute(LoginRoute());
  }

  Future<void> _fetchUser() async {
    try {
      turnLoading(isOn: true);
      _user = await _fetchUserCase.run();
      turnLoading(isOn: false);
    } catch (error) {
      _user = null;
      turnLoading(isOn: false);
      if (error is Exception) dev.log('[Error]', error: error);
    }
  }
}
