import 'package:flutter/material.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/widgets/form_fields/border.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.controller,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: text_styles.medium16.copyWith(color: UiKitColor.dark),
      cursorColor: UiKitColor.primary,
      validator: (value) {
        final validator = this.validator;
        if (validator == null) return null;
        final result = validator(value);
        return result;
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: texts.authorizationScreenLogin,
        counterText: '',
        helperText: ' ',
        filled: true,
        errorStyle: text_styles.medium13.copyWith(
          color: UiKitColor.error,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Assets.images.iconProfile.image(
            height: 24,
            width: 24,
          ),
        ),
        labelStyle: text_styles.medium16.copyWith(color: UiKitColor.dark),
        helperStyle: text_styles.medium16,
        fillColor: Colors.white,
        border: OutlinedTextFieldBorder.unfocus(),
        enabledBorder: OutlinedTextFieldBorder.unfocus(),
        focusedBorder: OutlinedTextFieldBorder.focus(),
        errorBorder: OutlinedTextFieldBorder.error(),
        focusedErrorBorder: OutlinedTextFieldBorder.error(),
        contentPadding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      ),
    );
  }
}
