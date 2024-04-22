part of 'app_navigator.dart';

extension _AuthorizeRoutesHandler on AppNavigator {
  Future<dynamic>? _handleAuthorizeFeatureRoute(
    AuthorizeFeatureRoute route,
  ) {
    if (route is LoginRoute) {
      appKey.currentState?.popUntil((route) => route.isFirst);
      return appKey.currentState?.push(assembleLoginScreen());
    }
    return null;
  }
}
