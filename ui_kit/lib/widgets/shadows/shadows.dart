import 'package:flutter/material.dart';

class Shadows {
  List<BoxShadow> get bottomGrey => [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 8,
          color: const Color(0xFF78909C).withOpacity(0.2),
        ),
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 4,
          color: const Color(0xFF78909C).withOpacity(0.12),
        ),
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 3,
          color: const Color(0xFF78909C).withOpacity(0.14),
        ),
      ];
}
