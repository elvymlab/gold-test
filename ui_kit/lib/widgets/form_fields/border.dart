import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class OutlinedTextFieldBorder extends OutlineInputBorder {
  OutlinedTextFieldBorder({
    required Color color,
    Key? key,
  }) : super(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: color,
          ),
        );

  factory OutlinedTextFieldBorder.unfocus() => OutlinedTextFieldBorder(color: UiKitColor.black);

  factory OutlinedTextFieldBorder.focus() => OutlinedTextFieldBorder(color: UiKitColor.primary);

  factory OutlinedTextFieldBorder.error() => OutlinedTextFieldBorder(color: UiKitColor.error);
}
