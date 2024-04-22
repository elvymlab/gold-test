import 'package:gold_test/models/entities/offer/offer_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_price_data.g.dart';

@JsonSerializable()
class OfferPriceData {
  OfferPriceData({
    this.size,
    this.price,
  });

  final String? size;
  final int? price;

  factory OfferPriceData.fromJson(Map<String, dynamic> json) => _$OfferPriceDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfferPriceDataToJson(this);

  OfferPrice toDomain() {
    return OfferPrice(
      size: size,
      price: price,
    );
  }
}
