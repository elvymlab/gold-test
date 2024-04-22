import 'dart:async';
import 'package:gold_test/models/api/errors/error_converter.dart';
import 'package:gold_test/models/entities/errors/network_error.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:dio/dio.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'dart:developer' as dev;

/// Миксин для отправки сообщения о неизвестной ошибки.
/// Использует [StreamController]<[AppMessage]>, для отправки
/// сообщения.
mixin HandleUnknowErrorWithStreamController {
  handleError(
    Object? error, {
    required StreamController<AppMessage> streamController,
  }) {
    _sendErrorMessage(streamController: streamController, error: error);
  }
}

void _sendErrorMessage({
  required Object? error,
  required StreamController<AppMessage> streamController,
}) {
  if (error is Exception) {
    dev.log('[Error]', error: error);
  }
  if (error is DioException) {
    _sendNetworkErrorMessage(
      error: error.toDomain(),
      streamController: streamController,
    );
    return;
  }
  if (error is NetworkError) {
    _sendNetworkErrorMessage(
      error: error,
      streamController: streamController,
    );
    return;
  }

  if (error is Exception) throw error;
}

void _sendNetworkErrorMessage({
  required NetworkError error,
  required StreamController<AppMessage> streamController,
}) {
  if (error is UnknownNetworkError) {
    streamController.add(
      AppMessage(
        text: texts.networkUnknownError,
        type: AppMessageColors.error,
      ),
    );
  }
  if (error is ClientNetworkError) {
    streamController.add(
      AppMessage(
        text: error.message ?? texts.commonUnknownError,
        type: AppMessageColors.error,
      ),
    );
  }
  if (error is ServerNetworkError) {
    streamController.add(
      AppMessage(
        text: error.message ?? texts.serverError,
        type: AppMessageColors.error,
      ),
    );
  }
}
