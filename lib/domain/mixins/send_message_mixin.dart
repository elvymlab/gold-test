import 'dart:async';

import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';


mixin SendMessageMixin {
  void sendMessage({
    required String message,
    required AppMessageColors messageType,
    required StreamController<AppMessage> streamController,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    streamController.add(
      AppMessage(
        text: message,
        type: messageType,
        duration: duration,
      ),
    );
  }
}