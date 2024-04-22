// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_detailed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDetailedData _$OfferDetailedDataFromJson(Map<String, dynamic> json) =>
    OfferDetailedData(
      code: json['code'] as String?,
      name: json['name'] as String?,
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => OfferPriceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      brand: json['brand'] as String?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => OfferPropertyData.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => OfferImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferDetailedDataToJson(OfferDetailedData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'brand': instance.brand,
      'prices': instance.prices,
      'properties': instance.properties,
      'attachments': instance.attachments,
    };
