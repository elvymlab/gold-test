import 'package:gold_test/models/entities/errors/app_error.dart';

abstract class NetworkError extends AppError {}

class UnknownNetworkError extends NetworkError {}

class AuthorizationNetworkError extends NetworkError {
  AuthorizationNetworkError();

}

class ClientNetworkError extends NetworkError {
  ClientNetworkError({this.message});

  final String? message;
}

class ServerNetworkError extends NetworkError {
  ServerNetworkError({this.message});

  final String? message;
}
