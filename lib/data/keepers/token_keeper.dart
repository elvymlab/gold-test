import 'package:gold_test/gateways/keepers/token_keeper.dart' as gateway;
import 'package:hive_flutter/hive_flutter.dart';

const String _tokenKey = 'tokenKey';

class TokensKeeper implements gateway.TokensKeeper {
  TokensKeeper({required Box<String?> box}) : _box = box {
    _setup();
  }

  final Box<String?> _box;

  String? _token;

  @override
  String? get token => _token;

  @override
  set token(String? value) {
    _box.put(_tokenKey, value);
    _token = value;
  }

  @override
  void clear() {
    token = null;
  }

  void _setup() {
    token = _fetchTokenBy(key: _tokenKey);
  }

  String? _fetchTokenBy({required String key}) {
    final value = _box.get(key);
    if (value != null) {
      return value;
    }
    return null;
  }
}
