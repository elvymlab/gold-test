import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/presentation/screens/map/map_screen.dart';
import 'package:gold_test/presentation/screens/map/state/map_screen_state.dart';
import 'package:provider/provider.dart';

MaterialPageRoute assembleMapScreen() {
  return MaterialPageRoute(
    builder: (_) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => GetIt.I.get<MapScreenState>(),
          ),
        ],
        child: const MapScreen(),
      );
    },
  );
}
