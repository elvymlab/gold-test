import 'package:flutter/material.dart' show ChangeNotifier, GlobalKey, NavigatorState;
import 'package:gold_test/presentation/navigation/navigators/nested_navigator.dart';
import 'package:gold_test/presentation/navigation/navigation_stack_indexes.dart' as stack_indexes;
import 'package:gold_test/presentation/navigation/routes/authorize_routes.dart';
import 'package:gold_test/presentation/navigation/routes/catalog_routes.dart';
import 'package:gold_test/presentation/navigation/routes/home_routes.dart';
import 'package:gold_test/presentation/navigation/routes/map_routes.dart';
import 'package:gold_test/presentation/navigation/routes/route.dart';
import 'package:gold_test/presentation/navigation/routes/scanner_routes.dart';
import 'package:gold_test/presentation/screens/login/assemble_login_screen.dart';
import 'package:gold_test/presentation/screens/offer_detailed/assemble_offer_detailed_screen.dart';

part 'map_routes_handler.dart';

part 'scan_routes_handler.dart';

part 'home_routes_handler.dart';

part 'authorize_routes_handler.dart';

part 'catalog_routes_handler.dart';

class AppNavigator extends ChangeNotifier {
  AppNavigator(this.appKey);

  final GlobalKey<NavigatorState> appKey;
  final nestedNavigators = [
    NestedNavigator.home(),
    NestedNavigator.scanner(),
    NestedNavigator.map(),
  ];
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  NavigatorState? get _nestedKeyState => nestedNavigators[_selectedTabIndex].navigationKey.currentState;

  set selectedTabIndex(int tabIndex) {
    if (tabIndex == _selectedTabIndex) {
      resetStack(tabIndex);
    } else {
      _selectedTabIndex = tabIndex;
      notifyListeners();
    }
  }

  Future<dynamic>? pushRoute(
    Route route,
  ) {
    if (route is HomeFeatureRoute) {
      return _handleHomeFeatureRoute(route);
    }
    if (route is ScannerFeatureRoute) {
      return _handleScannerFeatureRoute(route);
    }
    if (route is MapFeatureRoute) {
      return _handleMapFeatureRoute(route);
    }
    if (route is AuthorizeFeatureRoute) {
      return _handleAuthorizeFeatureRoute(route);
    }
    if (route is CatalogFeatureRoute) {
      return _handleCatalogFeatureRoute(route);
    }
    return null;
  }

  Future<bool> onWillPop() async {
    _nestedKeyState?.maybePop();
    final navigator = nestedNavigators[selectedTabIndex];
    if (navigator.navigationKey.currentState?.canPop() ?? false) {
      return false;
    }
    if (_selectedTabIndex > 0) {
      selectedTabIndex--;
      return false;
    }
    return true;
  }

  void resetStack(int index) {
    final navigator = nestedNavigators[index];
    navigator.navigationKey.currentState?.popUntil((route) => route.isFirst);
  }
}
