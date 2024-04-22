import 'package:dio/dio.dart';
import 'package:gold_test/models/api/errors/error_data.dart';
import 'package:gold_test/models/entities/errors/network_error.dart';

extension ConvertDioExceptionToNetworkError on DioException {
  NetworkError toDomain() {
    final statusCode = response?.statusCode;
    final json = response?.data;
    if (statusCode == null) return UnknownNetworkError();
    ErrorData? errorData;
    if (json != null && json.isNotEmpty) {
      errorData = ErrorData.fromJson(json);
    }
    if (statusCode == 406 || statusCode == 401) {
      return AuthorizationNetworkError();
    }
    if (statusCode >= 400 && statusCode < 500) {
      return ClientNetworkError(
        message: errorData?.message,
      );
    }
    if (statusCode >= 500) {
      return ServerNetworkError();
    }
    return UnknownNetworkError();
  }
}
