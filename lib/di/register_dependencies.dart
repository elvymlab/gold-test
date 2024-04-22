import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/data/network_service/authorization_trouble_resolver.dart';
import 'package:gold_test/data/network_service/request_trouble_resolver.dart';
import 'package:gold_test/di/register_dependencies.config.dart';
import 'package:gold_test/domain/storages/user/user_storage.dart';
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gold_test/data/keepers/token_keeper.dart';
import 'package:gold_test/data/network_service/network_service.dart';
import 'package:gold_test/env.dart';
import 'package:gold_test/gateways/keepers/token_keeper.dart' as token_keeper_gateway;
import 'package:injectable/injectable.dart';

bool _didRegister = false;

@InjectableInit(
  ignoreUnregisteredTypes: [AppEnvironment, AppNavigator, token_keeper_gateway.TokensKeeper, UserStorage],
  generateForDir: ["lib"],
)
Future<void> configureDependencies({
  required AppEnvironment env,
  required GlobalKey<NavigatorState> navigationKey,
}) async {
  if (_didRegister) return;
  GetIt.I.registerSingleton<AppEnvironment>(env);
  GetIt.I.registerLazySingleton(() => AppNavigator(navigationKey));
  await Hive.initFlutter();
  await GetIt.instance.init();
  _didRegister = true;
}

@module
abstract class DependenciesModule {
  @preResolve
  @lazySingleton
  Future<token_keeper_gateway.TokensKeeper> registerTokensKeeper() async {
    const boxName = 'Token';
    final tokenBox = await Hive.openBox<String?>(boxName);
    return TokensKeeper(box: tokenBox);
  }

  @lazySingleton
  UserStorage registerUserStorage() {
    final keeper = GetIt.I.get<token_keeper_gateway.TokensKeeper>();
    final navigator = GetIt.I.get<AppNavigator>();
    return UserStorage(tokensKeeper: keeper, navigator: navigator);
  }

  @lazySingleton
  RequestTroubleHandler registerRequestTroubleHandler() {
    final keeper = GetIt.I.get<token_keeper_gateway.TokensKeeper>();
    final authorizationTroubleResolver = GetIt.I.get<AuthorizationTroubleResolver>();
    return RequestTroubleHandler(
      authorizationTroubleResolver: authorizationTroubleResolver,
      tokensKeeper: keeper,
    );
  }

  @lazySingleton
  StreamController<AppMessage> registerAppMessageStreamController() =>
      StreamController();

  @lazySingleton
  Dio registerDio() {
    final keeper = GetIt.I.get<token_keeper_gateway.TokensKeeper>();
    final resolver = GetIt.I.get<RequestTroubleHandler>();
    final baseUrl = GetIt.I.get<AppEnvironment>().baseUrl;
    final builder = DioInstanceBuilder();
    builder.baseUrl = baseUrl;
    builder.addSettingTokenInterceptor(keeper: keeper);
    builder.addTroubleResolverInterceptor(resolver: resolver);

    return builder.build();
  }
}
