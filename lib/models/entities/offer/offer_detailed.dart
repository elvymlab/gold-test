import 'package:gold_test/models/entities/offer/offer_image.dart';
import 'package:gold_test/models/entities/offer/offer_price.dart';
import 'package:gold_test/models/entities/offer/offer_property.dart';

class OfferDetailed {
  OfferDetailed({
    required this.code,
    required this.name,
    required this.brand,
    required this.prices,
    required this.properties,
    required this.images,
  });

  final String code;
  final String name;
  final String brand;
  final List<OfferPrice> prices;
  final List<OfferProperty> properties;
  final List<OfferImage> images;
}
