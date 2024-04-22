import 'package:gold_test/models/entities/errors/mapping_error.dart';
import 'package:gold_test/models/entities/offer/offer_property.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_property_data.g.dart';

@JsonSerializable()
class OfferPropertyData {
  OfferPropertyData({
    this.name,
    this.value,
  });

  final String? name;
  final String? value;

  factory OfferPropertyData.fromJson(Map<String, dynamic> json) => _$OfferPropertyDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfferPropertyDataToJson(this);

  OfferProperty toDomain() {
    final name = this.name;
    final value = this.value;
    if (name == null || value == null) {
      throw MapToDomainModelError('Обязательные аргументы отсутствуют');
    }
    return OfferProperty(
      name: name,
      value: value,
    );
  }
}
