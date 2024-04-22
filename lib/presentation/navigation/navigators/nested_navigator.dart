import 'package:flutter/material.dart';
import 'package:gold_test/presentation/screens/home/assemble_home_screen.dart';
import 'package:gold_test/presentation/screens/map/assemble_map_screen.dart';
import 'package:gold_test/presentation/screens/scanner/assemble_scanner_screen.dart';

class NestedNavigator extends StatelessWidget {
  NestedNavigator._({
    Key? key,
    required MaterialPageRoute Function() startScreenBuilder,
  })  : _startScreenBuilder = startScreenBuilder,
        super(key: key);

  final navigationKey = GlobalKey<NavigatorState>();
  final MaterialPageRoute Function() _startScreenBuilder;

  factory NestedNavigator.home() {
    return NestedNavigator._(startScreenBuilder: assembleHomeScreen);
  }

  factory NestedNavigator.scanner() {
    return NestedNavigator._(startScreenBuilder: assembleScannerScreen);
  }

  factory NestedNavigator.map() {
    return NestedNavigator._(startScreenBuilder: assembleMapScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      onGenerateRoute: (_) => _startScreenBuilder(),
    );
  }
}
