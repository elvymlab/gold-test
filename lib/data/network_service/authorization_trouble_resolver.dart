import 'dart:async';
import 'package:gold_test/domain/storages/user/user_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthorizationTroubleResolver {
  AuthorizationTroubleResolver({
    required UserStorage userStorage,
  }) : _userStorage = userStorage;

  final UserStorage _userStorage;
  bool isStarted = false;
  Completer<bool>? _completer;

  Future<bool> resolve() async {
    await _start();
    return _completer!.future;
  }

  Future<void> _start() async {
    final completer = _completer;
    if (completer != null && !completer.isCompleted) return;
    _completer = Completer();
    try {
      await _userStorage.startLogin();
      _complete(true);
    } catch (_) {
      _complete(false);
    }
  }

  void _complete(bool isSuccess) {
    _completer!.complete(isSuccess);
  }
}
