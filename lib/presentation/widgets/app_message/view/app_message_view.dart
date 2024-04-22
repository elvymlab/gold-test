import 'package:flutter/material.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class AppMessageView extends StatelessWidget {
  const AppMessageView({
    super.key,
    required AppMessage message,
  }) : _message = message;

  final AppMessage _message;

  @override
  Widget build(BuildContext context) {
    final colors = _AppMessageViewColors.byType(_message.type);
    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultTextStyle(
            style: text_styles.medium14.copyWith(
              color: colors.primaryColor,
            ),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Text(
                  _message.text,
                  style: text_styles.medium14.copyWith(
                    color: colors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _AppMessageViewColors {
  _AppMessageViewColors({
    required this.backgroundColor,
    required this.primaryColor,
  });

  factory _AppMessageViewColors.byType(AppMessageColors type) {
    switch (type) {
      case AppMessageColors.success:
        return _AppMessageViewColors(
          backgroundColor: UiKitColor.alertSuccess,
          primaryColor: UiKitColor.success,
        );

      case AppMessageColors.error:
        return _AppMessageViewColors(
          backgroundColor: UiKitColor.alertError,
          primaryColor: UiKitColor.error,
        );
      case AppMessageColors.info:
        return _AppMessageViewColors(
          backgroundColor: UiKitColor.primaryLight.withOpacity(0.8),
          primaryColor: UiKitColor.primary,
        );
    }
  }

  final Color backgroundColor;
  final Color primaryColor;
}
