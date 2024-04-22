import 'package:dio/dio.dart';
import 'package:gold_test/data/network_service/request_trouble_resolver.dart';
import 'package:gold_test/gateways/keepers/token_keeper.dart';
import 'package:gold_test/models/api/errors/error_converter.dart';

const _acceptHeaderKey = 'Accept';
const _authorizationHeaderKey = 'Authorization';

class DioInstanceBuilder {
  String? _baseUrl;
  TokensKeeper? _keeper;
  RequestTroubleHandler? _requestTroubleHandler;
  bool _isNeedSettingTokenInterceptor = false;
  bool _isNeedTroubleResolverInterceptor = false;

  set baseUrl(String value) {
    _baseUrl = value;
  }

  void addSettingTokenInterceptor({required TokensKeeper keeper}) {
    _isNeedSettingTokenInterceptor = true;
    _keeper = keeper;
  }

  void addTroubleResolverInterceptor({required RequestTroubleHandler resolver}) {
    _isNeedTroubleResolverInterceptor = true;
    _requestTroubleHandler = resolver;
  }

  Dio build() {
    final dio = Dio();
    final baseUrl = _baseUrl;
    final keeper = _keeper;
    final requestTroubleHandler = _requestTroubleHandler;
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    dio.options.headers['content-type'] = 'application/json';
    dio.options.headers[_acceptHeaderKey] = 'application/json; charset=UTF-8';

    if (_isNeedSettingTokenInterceptor && keeper != null) {
      final interceptor = _makeSettingTokenInterceptor(keeper);
      dio.interceptors.add(interceptor);
    }
    if (_isNeedTroubleResolverInterceptor && requestTroubleHandler != null) {
      dio.interceptors.add(
        _makeRequestTroubleResolveInterceptor(
          requestTroubleHandler,
          dio,
        ),
      );
    }

    dio.options.headers[_acceptHeaderKey] = 'application/json; charset=UTF-8';
    return dio;
  }

  Interceptor _makeSettingTokenInterceptor(
    TokensKeeper keeper,
  ) {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = keeper.token;
        if (token != null) {
          final authorizationHeader = 'Bearer $token';
          options.headers[_authorizationHeaderKey] = authorizationHeader;
        }
        handler.next(options);
      },
    );
  }

  Interceptor _makeRequestTroubleResolveInterceptor(
    RequestTroubleHandler troubleHandler,
    Dio dio,
  ) {
    return InterceptorsWrapper(
      onError: (dioException, handler) async {
        final statusCode = dioException.response?.statusCode;
        if (statusCode == null || statusCode < 300) {
          handler.next(dioException);
          return;
        }
        try {
          final error = dioException.toDomain();
          final isResolved = await troubleHandler.tryResolve(error);
          if (!isResolved) {
            handler.next(dioException);
            return;
          }
          final result = await dio.request(
            dioException.requestOptions.path,
            options: Options(
              method: dioException.requestOptions.method,
              headers: dioException.requestOptions.headers,
            ),
            data: dioException.requestOptions.data,
            queryParameters: dioException.requestOptions.queryParameters,
          );
          handler.resolve(result);
          return;
        } catch (_) {
          handler.next(dioException);
          return;
        }
      },
    );
  }
}
