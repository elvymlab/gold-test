import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/presentation/screens/login/login_screen.dart';
import 'package:gold_test/presentation/screens/login/state/login_screen_state.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:provider/provider.dart';

MaterialPageRoute assembleLoginScreen() {
  return MaterialPageRoute(
    builder: (_) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => GetIt.I.get<LoginScreenState>(),
          ),
          Provider<StreamController<AppMessage>>(
            create: (_) => GetIt.I.get<StreamController<AppMessage>>(),
          ),
        ],
        child: const LoginScreen(),
      );
    },
  );
}
