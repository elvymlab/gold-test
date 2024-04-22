import 'package:gold_test/presentation/navigation/routes/route.dart';

abstract class CatalogFeatureRoute extends Route {}

class OfferRoute extends CatalogFeatureRoute {
  OfferRoute({
    required this.barcode,
  });

  final String barcode;
}
