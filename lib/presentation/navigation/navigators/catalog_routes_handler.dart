part of 'app_navigator.dart';

extension _CatalogRoutesHandler on AppNavigator {
  Future<dynamic>? _handleCatalogFeatureRoute(
    CatalogFeatureRoute route,
  ) {
    if (route is OfferRoute) {
      return _nestedKeyState?.push(
        assembleOfferDetailedScreen(
          barcode: route.barcode,
        ),
      );
    }
    return null;
  }
}
