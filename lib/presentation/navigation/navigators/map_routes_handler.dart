part of 'app_navigator.dart';

extension _MapRoutesHandler on AppNavigator {
  Future<dynamic>? _handleMapFeatureRoute(
    MapFeatureRoute route,
  ) {
    if (route is MapRoute) {
      selectedTabIndex = stack_indexes.map;
      resetStack(selectedTabIndex);
      return null;
    }
    return null;
  }
}
