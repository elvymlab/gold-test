import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_test/presentation/screens/login/widgets/password_change_visibility.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/widgets/form_fields/border.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.controller,
    this.hint = 'Пароль',
    this.formatters,
    this.validator,
    this.maxLength = 255,
    this.customError,
    FocusNode? focusNode,
    this.isEnableAutoFocusAfterError = true,
    Key? key,
    this.textInputAction,
    this.onSubmitted,
    this.autofillHints = const [AutofillHints.password],
  })  : transferredFocusNode = focusNode,
        super(key: key);

  final List<String> autofillHints;
  final void Function(String)? onSubmitted;
  final TextEditingController controller;
  final String hint;
  final String? customError;
  final int maxLength;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;
  final bool isEnableAutoFocusAfterError;
  final FocusNode? transferredFocusNode;
  final TextInputAction? textInputAction;

  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isNeedHidePassword = true;
  final defaultFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final focusNode = widget.transferredFocusNode ?? defaultFocusNode;
    return TextFormField(
      autofillHints: widget.autofillHints,
      onFieldSubmitted: widget.onSubmitted,
      focusNode: focusNode,
      controller: widget.controller,
      style: text_styles.medium16.copyWith(color: UiKitColor.dark),
      cursorColor: UiKitColor.primary,
      obscureText: _isNeedHidePassword,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      validator: (value) {
        final validator = widget.validator;
        if (validator == null) return null;
        final result = validator(value);
        if (result != null && widget.isEnableAutoFocusAfterError) {
          focusNode.requestFocus();
        }
        return result;
      },
      maxLength: widget.maxLength,
      inputFormatters: widget.formatters,
      decoration: InputDecoration(
        errorText: widget.customError,
        labelText: widget.hint,
        counterText: '',
        helperText: ' ',
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: PasswordChangeVisibilityButton(
            isNeedHidePassword: _isNeedHidePassword,
            onPressed: _reverseState,
          ),
        ),
        errorStyle: text_styles.medium13.copyWith(
          color: UiKitColor.error,
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

  void _reverseState() {
    setState(() {
      _isNeedHidePassword = !_isNeedHidePassword;
    });
  }

  @override
  void dispose() {
    defaultFocusNode.dispose();
    super.dispose();
  }
}
