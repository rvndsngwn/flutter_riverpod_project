/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:lottie/lottie.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/harlow.ttf
  String get harlow => 'assets/fonts/harlow.ttf';

  /// File path: assets/fonts/mohesu.ttf
  String get mohesu => 'assets/fonts/mohesu.ttf';

  /// List of all assets
  List<String> get values => [harlow, mohesu];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/P-intro.json
  LottieGenImage get pIntro =>
      const LottieGenImage('assets/lottie/P-intro.json');

  /// File path: assets/lottie/add-user.json
  LottieGenImage get addUser =>
      const LottieGenImage('assets/lottie/add-user.json');

  /// File path: assets/lottie/astronaut.json
  LottieGenImage get astronaut =>
      const LottieGenImage('assets/lottie/astronaut.json');

  /// File path: assets/lottie/calendar-booking.json
  LottieGenImage get calendarBooking =>
      const LottieGenImage('assets/lottie/calendar-booking.json');

  /// File path: assets/lottie/error.json
  LottieGenImage get error => const LottieGenImage('assets/lottie/error.json');

  /// File path: assets/lottie/error404.json
  LottieGenImage get error404 =>
      const LottieGenImage('assets/lottie/error404.json');

  /// File path: assets/lottie/info.json
  LottieGenImage get info => const LottieGenImage('assets/lottie/info.json');

  /// File path: assets/lottie/info1.json
  LottieGenImage get info1 => const LottieGenImage('assets/lottie/info1.json');

  /// File path: assets/lottie/ipification-tech.json
  LottieGenImage get ipificationTech =>
      const LottieGenImage('assets/lottie/ipification-tech.json');

  /// File path: assets/lottie/no-data.json
  LottieGenImage get noData =>
      const LottieGenImage('assets/lottie/no-data.json');

  /// File path: assets/lottie/profile-user.json
  LottieGenImage get profileUser =>
      const LottieGenImage('assets/lottie/profile-user.json');

  /// File path: assets/lottie/search.json
  LottieGenImage get search =>
      const LottieGenImage('assets/lottie/search.json');

  /// File path: assets/lottie/success-interaction.json
  LottieGenImage get successInteraction =>
      const LottieGenImage('assets/lottie/success-interaction.json');

  /// File path: assets/lottie/success.json
  LottieGenImage get success =>
      const LottieGenImage('assets/lottie/success.json');

  /// List of all assets
  List<LottieGenImage> get values => [
        pIntro,
        addUser,
        astronaut,
        calendarBooking,
        error,
        error404,
        info,
        info1,
        ipificationTech,
        noData,
        profileUser,
        search,
        successInteraction,
        success
      ];
}

class $AssetsMohesuGen {
  const $AssetsMohesuGen();

  /// File path: assets/mohesu/darkMap.jpeg
  AssetGenImage get darkMap =>
      const AssetGenImage('assets/mohesu/darkMap.jpeg');

  /// File path: assets/mohesu/lightMap.jpeg
  AssetGenImage get lightMap =>
      const AssetGenImage('assets/mohesu/lightMap.jpeg');

  /// File path: assets/mohesu/logo_mohesu.png
  AssetGenImage get logoMohesu =>
      const AssetGenImage('assets/mohesu/logo_mohesu.png');

  /// File path: assets/mohesu/m.jpg
  AssetGenImage get mJpg => const AssetGenImage('assets/mohesu/m.jpg');

  /// File path: assets/mohesu/m.png
  AssetGenImage get mPng => const AssetGenImage('assets/mohesu/m.png');

  /// File path: assets/mohesu/mohesu.png
  AssetGenImage get mohesuPng =>
      const AssetGenImage('assets/mohesu/mohesu.png');

  /// File path: assets/mohesu/mohesu.svg
  String get mohesuSvg => 'assets/mohesu/mohesu.svg';

  /// List of all assets
  List<dynamic> get values =>
      [darkMap, lightMap, logoMohesu, mJpg, mPng, mohesuPng, mohesuSvg];
}

class $AssetsRiveGen {
  const $AssetsRiveGen();

  /// File path: assets/rive/error.riv
  RiveGenImage get error => const RiveGenImage('assets/rive/error.riv');

  /// File path: assets/rive/globe-loding.riv
  RiveGenImage get globeLoding =>
      const RiveGenImage('assets/rive/globe-loding.riv');

  /// File path: assets/rive/mail-send.riv
  RiveGenImage get mailSend => const RiveGenImage('assets/rive/mail-send.riv');

  /// File path: assets/rive/search.riv
  RiveGenImage get search => const RiveGenImage('assets/rive/search.riv');

  /// File path: assets/rive/server.riv
  RiveGenImage get server => const RiveGenImage('assets/rive/server.riv');

  /// File path: assets/rive/success.riv
  RiveGenImage get success => const RiveGenImage('assets/rive/success.riv');

  /// List of all assets
  List<RiveGenImage> get values =>
      [error, globeLoding, mailSend, search, server, success];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsMohesuGen mohesu = $AssetsMohesuGen();
  static const $AssetsRiveGen rive = $AssetsRiveGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    String? package,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class RiveGenImage {
  const RiveGenImage(this._assetName);

  final String _assetName;

  RiveAnimation rive({
    String? artboard,
    List<String> animations = const [],
    List<String> stateMachines = const [],
    BoxFit? fit,
    Alignment? alignment,
    Widget? placeHolder,
    bool antialiasing = true,
    List<RiveAnimationController> controllers = const [],
    OnInitCallback? onInit,
  }) {
    return RiveAnimation.asset(
      _assetName,
      artboard: artboard,
      animations: animations,
      stateMachines: stateMachines,
      fit: fit,
      alignment: alignment,
      placeHolder: placeHolder,
      antialiasing: antialiasing,
      controllers: controllers,
      onInit: onInit,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
