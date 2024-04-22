import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class DotsSpacer extends StatelessWidget {
  const DotsSpacer({
    Key? key,
    this.dyOffset = -6,
  }) : super(key: key);
  final double dyOffset;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomPaint(
        painter: _DotsPainter(dyOffset),
      ),
    );
  }
}

class _DotsPainter extends CustomPainter {
  _DotsPainter(dyOffset) : _dyOffset = dyOffset;

  final double _dyOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final point = TextPainter(
      text: const TextSpan(
        text: "- ",
        style: TextStyle(color: UiKitColor.grey04),
      ),
      textDirection: TextDirection.ltr,
    );
    point.layout(maxWidth: size.width);

    for (double index = 0; index < size.width; index += point.width) {
      point.paint(
        canvas,
        Offset(index, _dyOffset),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
