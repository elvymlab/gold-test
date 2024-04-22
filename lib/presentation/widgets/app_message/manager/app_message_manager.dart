import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:gold_test/presentation/widgets/app_message/view/app_message_view.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldMessengerState> globalSnackBarKey = GlobalKey<ScaffoldMessengerState>();

class AppMessageManager extends StatefulWidget {
  const AppMessageManager({super.key});

  @override
  State<StatefulWidget> createState() => AppMessageManagerState();
}

class AppMessageManagerState extends State<AppMessageManager> {
  AppMessage? message;

  @override
  void initState() {
    final stream = context.read<StreamController<AppMessage>>().stream;
    stream.listen((message) {
      _show(appMessage: message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  SnackBar _showSnackBarView(AppMessage appMessage) {
    return SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      duration: appMessage.duration,
      content: AppMessageView(
        message: appMessage,
      ),
    );
  }

  void _show({
    required AppMessage appMessage,
  }) {
    globalSnackBarKey.currentState?.showSnackBar(
      _showSnackBarView(appMessage),
    );
  }
}
