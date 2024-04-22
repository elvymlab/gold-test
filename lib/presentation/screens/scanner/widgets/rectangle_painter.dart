import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = UiKitColor.white;

    Paint paintBorder = Paint()
      ..color = UiKitColor.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width * 0.85,
        height: size.height * 0.55,
      ),
      const Radius.circular(17),
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRect(
            Rect.fromLTWH(0, 0, size.width, size.height),
          ),
        Path()
          ..addRRect(rRect)
          ..close(),
      ),
      paint,
    );
    Path path = Path();
    path.addRRect(rRect);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}