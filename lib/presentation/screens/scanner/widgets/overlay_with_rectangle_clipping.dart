import 'package:flutter/material.dart';
import 'package:gold_test/presentation/screens/scanner/state/scanner_screen_state.dart';
import 'package:gold_test/presentation/screens/scanner/widgets/rectangle_painter.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/widgets/buttons/action_button.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class OverlayWithRectangleClipping extends StatelessWidget {
  const OverlayWithRectangleClipping({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScannerScreenState>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: RectanglePainter(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              alignment: Alignment.topCenter,
              child: const Text(
                texts.scanHint,
                style: text_styles.medium18,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: state.isButtonEnable
                  ? ActionButton.primary(
                      texts.scanGoTo,
                      onPressed: state.onGoToResultButtonPressed,
                    )
                  : ActionButton.disabled(texts.scanGoTo),
            ),
          ),
        ],
      ),
    );
  }
}
