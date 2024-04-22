import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gold_test/env.dart';
import 'presentation/app/app_starter.dart';

class MyHttpOverrides extends HttpOverrides {
// На Android возникла ошибка проверки SSL Wildcard сертификата.
// Ошибка CERTIFICATE_VERIFY_FAILED: Hostname mismatch. Хостнейм helper_dev.ourgold.ru не распознается как *.ourgold.ru из сертификата.
// Были перепробованы разные доступные мне варианты. Все оказались  безрезультатными. Поэтому был добавлен badCertificateCallback.
// Вариант решения - подключить в проекте сертификат с явным указанием хостнейма (не wildcard).
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (cert, _, port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await startApp(AppEnvironment.dev());
}
