// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:gold_test/data/network_service/authorization_trouble_resolver.dart'
    as _i14;
import 'package:gold_test/data/network_service/request_header_maker.dart'
    as _i19;
import 'package:gold_test/data/network_service/request_trouble_resolver.dart'
    as _i5;
import 'package:gold_test/di/register_dependencies.dart' as _i22;
import 'package:gold_test/domain/storages/user/user_storage.dart' as _i12;
import 'package:gold_test/domain/use_cases/authorization/authorization_case.dart'
    as _i20;
import 'package:gold_test/domain/use_cases/offer/fetch_offer_detailed_case.dart'
    as _i15;
import 'package:gold_test/domain/use_cases/user/fetch_user_case.dart' as _i16;
import 'package:gold_test/gateways/data_providers/authorization/authorization_data_provider.dart'
    as _i13;
import 'package:gold_test/gateways/data_providers/offer/offer_detailed_data_provider.dart'
    as _i4;
import 'package:gold_test/gateways/data_providers/user/user_data_provider.dart'
    as _i11;
import 'package:gold_test/gateways/keepers/token_keeper.dart' as _i10;
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart'
    as _i7;
import 'package:gold_test/presentation/screens/home/state/home_screen_state.dart'
    as _i17;
import 'package:gold_test/presentation/screens/login/state/login_screen_state.dart'
    as _i21;
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart'
    as _i18;
import 'package:gold_test/presentation/screens/scanner/state/scanner_screen_state.dart'
    as _i6;
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart'
    as _i9;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dependenciesModule = _$DependenciesModule();
    gh.lazySingleton<_i3.Dio>(() => dependenciesModule.registerDio());
    gh.lazySingleton<_i4.OfferDetailedDataProvider>(
        () => _i4.OfferDetailedDataProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.RequestTroubleHandler>(
        () => dependenciesModule.registerRequestTroubleHandler());
    gh.factory<_i6.ScannerScreenState>(
        () => _i6.ScannerScreenState(appNavigator: gh<_i7.AppNavigator>()));
    gh.lazySingleton<_i8.StreamController<_i9.AppMessage>>(
        () => dependenciesModule.registerAppMessageStreamController());
    await gh.lazySingletonAsync<_i10.TokensKeeper>(
      () => dependenciesModule.registerTokensKeeper(),
      preResolve: true,
    );
    gh.lazySingleton<_i11.UserDataProvider>(
        () => _i11.UserDataProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i12.UserStorage>(
        () => dependenciesModule.registerUserStorage());
    gh.lazySingleton<_i13.AuthorizationDataProvider>(
        () => _i13.AuthorizationDataProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i14.AuthorizationTroubleResolver>(() =>
        _i14.AuthorizationTroubleResolver(userStorage: gh<_i12.UserStorage>()));
    gh.factory<_i15.FetchOfferDetailedCase>(() => _i15.FetchOfferDetailedCase(
        provider: gh<_i4.OfferDetailedDataProvider>()));
    gh.factory<_i16.FetchUserCase>(
        () => _i16.FetchUserCase(provider: gh<_i11.UserDataProvider>()));
    gh.factory<_i17.HomeScreenState>(() => _i17.HomeScreenState(
          fetchUserCase: gh<_i16.FetchUserCase>(),
          userStorage: gh<_i12.UserStorage>(),
          appNavigator: gh<_i7.AppNavigator>(),
        ));
    gh.factoryParam<_i18.OfferDetailsScreenState, String, dynamic>((
      barcode,
      _,
    ) =>
        _i18.OfferDetailsScreenState(
          barcode: barcode,
          fetchOfferDetailedCase: gh<_i15.FetchOfferDetailedCase>(),
        ));
    gh.lazySingleton<_i19.RequestHeaderMaker>(
        () => _i19.RequestHeaderMaker(tokensKeeper: gh<_i10.TokensKeeper>()));
    gh.factory<_i20.AuthorizationCase>(() => _i20.AuthorizationCase(
          provider: gh<_i13.AuthorizationDataProvider>(),
          tokensKeeper: gh<_i10.TokensKeeper>(),
        ));
    gh.factory<_i21.LoginScreenState>(() => _i21.LoginScreenState(
          authorizationCase: gh<_i20.AuthorizationCase>(),
          appMessageStreamController:
              gh<_i8.StreamController<_i9.AppMessage>>(),
        ));
    return this;
  }
}

class _$DependenciesModule extends _i22.DependenciesModule {}
