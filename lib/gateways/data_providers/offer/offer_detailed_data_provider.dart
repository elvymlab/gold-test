import 'package:gold_test/models/api/offer/offer_detailed_data.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'offer_detailed_data_provider.g.dart';

@lazySingleton
@RestApi()
abstract class OfferDetailedDataProvider {
  @factoryMethod
  factory OfferDetailedDataProvider(Dio dio) = _OfferDetailedDataProvider;

  @GET('/good/{barcode}')
  Future<OfferDetailedData> getOfferDetailed({
    @Path('barcode') required String barcode,
  });
}
