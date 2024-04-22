import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/presentation/screens/home/home_screen.dart';
import 'package:gold_test/presentation/screens/home/state/home_screen_state.dart';
import 'package:provider/provider.dart';

MaterialPageRoute assembleHomeScreen() {
  return MaterialPageRoute(
    builder: (_) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => GetIt.I.get<HomeScreenState>(),
          ),
        ],
        child: const HomeScreen(),
      );
    },
  );
}
