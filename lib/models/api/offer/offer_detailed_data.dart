import 'package:gold_test/models/api/offer/offer_image_data.dart';
import 'package:gold_test/models/api/offer/offer_price_data.dart';
import 'package:gold_test/models/api/offer/offer_property_data.dart';
import 'package:gold_test/models/entities/errors/mapping_error.dart';
import 'package:gold_test/models/entities/offer/offer_detailed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_detailed_data.g.dart';

@JsonSerializable()
class OfferDetailedData {
  OfferDetailedData({
    this.code,
    this.name,
    this.prices,
    this.brand,
    this.properties,
    this.attachments,
  });

  final String? code;
  final String? name;
  final String? brand;
  final List<OfferPriceData>? prices;
  final List<OfferPropertyData>? properties;
  final List<OfferImageData>? attachments;

  factory OfferDetailedData.fromJson(Map<String, dynamic> json) => _$OfferDetailedDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDetailedDataToJson(this);

  OfferDetailed toDomain() {
    final name = this.name;
    final code = this.code;
    if (name == null || code == null) {
      throw MapToDomainModelError('Обязательные аргументы отсутствуют');
    }

    final prices = this.prices?.map((price) => price.toDomain()).toList() ?? [];
    final properties = this.properties?.map((property) => property.toDomain()).toList() ?? [];
    final images = attachments?.map((image) => image.toDomain()).toList() ?? [];
    return OfferDetailed(
      code: code,
      name: name,
      brand: brand ?? '',
      prices: prices,
      properties: properties,
      images: images,
    );
  }
}
