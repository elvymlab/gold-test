/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/eye-off.png
  AssetGenImage get eyeOff => const AssetGenImage('assets/images/eye-off.png');

  /// File path: assets/images/eye.png
  AssetGenImage get eye => const AssetGenImage('assets/images/eye.png');

  /// File path: assets/images/icon-checkbox.png
  AssetGenImage get iconCheckbox =>
      const AssetGenImage('assets/images/icon-checkbox.png');

  /// File path: assets/images/icon-empty-checkbox.png
  AssetGenImage get iconEmptyCheckbox =>
      const AssetGenImage('assets/images/icon-empty-checkbox.png');

  /// File path: assets/images/icon-exit.png
  AssetGenImage get iconExit =>
      const AssetGenImage('assets/images/icon-exit.png');

  /// File path: assets/images/icon-home.png
  AssetGenImage get iconHome =>
      const AssetGenImage('assets/images/icon-home.png');

  /// File path: assets/images/icon-map.png
  AssetGenImage get iconMap =>
      const AssetGenImage('assets/images/icon-map.png');

  /// File path: assets/images/icon-no-photo.png
  AssetGenImage get iconNoPhoto =>
      const AssetGenImage('assets/images/icon-no-photo.png');

  /// File path: assets/images/icon-profile.png
  AssetGenImage get iconProfile =>
      const AssetGenImage('assets/images/icon-profile.png');

  /// File path: assets/images/icon-scan.png
  AssetGenImage get iconScan =>
      const AssetGenImage('assets/images/icon-scan.png');

  /// File path: assets/images/image-profile.png
  AssetGenImage get imageProfile =>
      const AssetGenImage('assets/images/image-profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        eyeOff,
        eye,
        iconCheckbox,
        iconEmptyCheckbox,
        iconExit,
        iconHome,
        iconMap,
        iconNoPhoto,
        iconProfile,
        iconScan,
        imageProfile
      ];
}

class Assets {
  Assets._();

  static const String package = 'ui_kit';

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  static const String package = 'ui_kit';

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/ui_kit/$_assetName';
}
