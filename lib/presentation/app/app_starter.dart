import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_test/di/register_dependencies.dart';
import 'package:gold_test/env.dart';
import 'package:gold_test/presentation/app/app.dart';
import 'package:ui_kit/assets/colors.gen.dart';

Future<void> startApp(AppEnvironment env) async {
  final navigationKey = GlobalKey<NavigatorState>();
  await configureDependencies(env: env, navigationKey: navigationKey);

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: UiKitColor.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  return runApp(
    App(environment: env),
  );
}
