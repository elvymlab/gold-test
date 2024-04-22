import 'package:gold_test/models/entities/errors/app_error.dart';

class MapToDomainModelError extends AppError {
  MapToDomainModelError(this.message);

  final String message;

  @override
  String toString() => message;
}
