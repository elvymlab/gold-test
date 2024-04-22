import 'package:gold_test/gateways/data_providers/user/user_data_provider.dart';
import 'package:gold_test/models/entities/user/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchUserCase {
  FetchUserCase({
    required UserDataProvider provider,
  }) : _provider = provider;

  final UserDataProvider _provider;

  Future<User> run() async {
    final result = await _provider.getUser();
    return result.toDomain();
  }
}
