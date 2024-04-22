import 'package:gold_test/gateways/data_providers/offer/offer_detailed_data_provider.dart';
import 'package:gold_test/models/entities/offer/offer_detailed.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchOfferDetailedCase {
  FetchOfferDetailedCase({
    required OfferDetailedDataProvider provider,
  }) : _provider = provider;
  final OfferDetailedDataProvider _provider;

  Future<OfferDetailed> run({required String barcode}) async {
    final result = await _provider.getOfferDetailed(barcode: barcode);
    return result.toDomain();
  }
}
