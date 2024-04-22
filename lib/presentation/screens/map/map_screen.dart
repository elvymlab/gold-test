import 'package:flutter/material.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          texts.functionalityNotImplemented,
          style: text_styles.extraBold18,
        ),
      ),
    );
  }
}
