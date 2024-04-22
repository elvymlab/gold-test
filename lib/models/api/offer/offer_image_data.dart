import 'package:gold_test/models/entities/errors/mapping_error.dart';
import 'package:gold_test/models/entities/offer/offer_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_image_data.g.dart';

@JsonSerializable()
class OfferImageData {
  OfferImageData({
    this.name,
    this.path,
  });

  final String? name;
  final String? path;

  factory OfferImageData.fromJson(Map<String, dynamic> json) => _$OfferImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfferImageDataToJson(this);

  OfferImage toDomain() {
    final path = this.path;
    if (path == null) {
      throw MapToDomainModelError('Обязательные аргументы отсутствуют');
    }
    return OfferImage(
      path: path,
      name: name,
    );
  }
}
