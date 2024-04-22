import 'package:flutter/material.dart';
import 'package:ui_kit/assets/assets.gen.dart';

class PasswordChangeVisibilityButton extends StatelessWidget {
  const PasswordChangeVisibilityButton({
    Key? key,
    this.onPressed,
    required this.isNeedHidePassword,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool isNeedHidePassword;

  @override
  Widget build(BuildContext context) {
    final asset = isNeedHidePassword
        ? Assets.images.eyeOff
        : Assets.images.eye;
    return InkWell(
      onTap: onPressed,
      child: asset.image(height: 24, width: 24),
    );
  }
}
