part of 'app_navigator.dart';

extension _ScannerRoutesHandler on AppNavigator {
  Future<dynamic>? _handleScannerFeatureRoute(
      ScannerFeatureRoute route,
      ) {
    if (route is ScannerRoute) {
      selectedTabIndex = stack_indexes.scan;
      resetStack(selectedTabIndex);
      return null;
    }
    return null;
  }
}