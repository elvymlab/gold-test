import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({
    Key? key,
    this.isEnableTouches = true,
    this.isBackgroundShowing = true,
  }) : super(key: key);

  final bool isBackgroundShowing;
  final bool isEnableTouches;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isEnableTouches,
      child: Container(
        color: isBackgroundShowing ? UiKitColor.light.withOpacity(0.40) : null,
        child: const Center(
          child: CircularProgressIndicator(color: UiKitColor.primary),
        ),
      ),
    );
  }
}
