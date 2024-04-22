import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as external_shimmer_library;

class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });

  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return external_shimmer_library.Shimmer.fromColors(
      highlightColor: Colors.white12,
      baseColor: Colors.black12,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
      ),
    );
  }
}
