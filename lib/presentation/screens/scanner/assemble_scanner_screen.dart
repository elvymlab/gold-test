import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/presentation/screens/scanner/scanner_screen.dart';
import 'package:gold_test/presentation/screens/scanner/state/scanner_screen_state.dart';
import 'package:provider/provider.dart';

MaterialPageRoute assembleScannerScreen() {
  return MaterialPageRoute(
    builder: (_) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => GetIt.I.get<ScannerScreenState>(),
          ),
        ],
        child: const ScannerScreen(),
      );
    },
  );
}
