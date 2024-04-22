import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold_test/domain/mixins/handle_error.dart';
import 'package:gold_test/domain/mixins/loading_state_switch_mixin.dart';
import 'package:gold_test/domain/mixins/send_message_mixin.dart';
import 'package:gold_test/domain/use_cases/authorization/authorization_case.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:injectable/injectable.dart';
import 'package:gold_test/resources/texts.dart' as texts;

@injectable
class LoginScreenState extends ChangeNotifier
    with LoadingStateSwitch, HandleUnknowErrorWithStreamController, SendMessageMixin {
  LoginScreenState({
    required AuthorizationCase authorizationCase,
    required StreamController<AppMessage> appMessageStreamController,
  })  : _authorizationCase = authorizationCase,
        _appMessageStreamController = appMessageStreamController;

  final AuthorizationCase _authorizationCase;
  final StreamController<AppMessage> _appMessageStreamController;

  bool _isRememberCheck = true;

  bool get isRememberCheck => _isRememberCheck;

  void checkRemember() {
    _isRememberCheck = !_isRememberCheck;
    notifyListeners();
  }

  void onFogotPasswordPressed() {
    sendMessage(
      message: texts.functionalityNotImplemented,
      messageType: AppMessageColors.info,
      streamController: _appMessageStreamController,
    );
  }

  Future<String> authorize({
    required String login,
    required String password,
  }) async {
    final token = await _authorizationCase.run(
      login: login,
      password: password,
      remember: isRememberCheck,
    );

    return token;
  }
}
