import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gold_test/presentation/widgets/shimmer/shimmer.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'dart:developer' as dev;

class SafeCachedNetworkImage extends StatelessWidget {
  const SafeCachedNetworkImage({
    super.key,
    this.imageUrl,
    this.errorWidget,
    this.width,
    this.height,
    this.boxFit,
    this.borderRadius,
  });

  final String? imageUrl;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    var errorWidget = this.errorWidget;
    errorWidget ??= SizedBox(
      width: width,
      height: height,
      child: _buildImage(Assets.images.iconNoPhoto.image().image),
    );
    final imageUrl = this.imageUrl;
    if (imageUrl != null && Uri.parse(imageUrl).isAbsolute) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) {
          return _buildImage(
            imageProvider,
            borderRadius: borderRadius,
            boxFit: boxFit,
          );
        },
        placeholder: (_, __) => Shimmer(
          height: height,
          width: width,
          borderRadius: borderRadius,
        ),
        errorWidget: (_, __, error) {
          if (error is Exception) {
            dev.log('[Error]', error: error);
          }
          return errorWidget!;
        },
      );
    } else {
      return errorWidget;
    }
  }

  Widget _buildImage(
    ImageProvider<Object> imageProvider, {
    BoxFit? boxFit,
    BorderRadius? borderRadius,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: boxFit,
          image: imageProvider,
        ),
        borderRadius: borderRadius,
      ),
    );
  }
}
