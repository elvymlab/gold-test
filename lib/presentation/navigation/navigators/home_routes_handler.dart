part of 'app_navigator.dart';

extension _HomeRoutesHandler on AppNavigator {
  Future<dynamic>? _handleHomeFeatureRoute(
      HomeFeatureRoute route,
      ) {
    if (route is HomeRoute) {
      selectedTabIndex = stack_indexes.home;
      resetStack(selectedTabIndex);
      return null;
    }
    return null;
  }
}