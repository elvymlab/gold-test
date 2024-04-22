import 'package:flutter/cupertino.dart';
import 'package:gold_test/domain/mixins/loading_state_switch_mixin.dart';
import 'package:gold_test/domain/use_cases/offer/fetch_offer_detailed_case.dart';
import 'package:gold_test/models/entities/offer/offer_detailed.dart';
import 'package:gold_test/models/entities/offer/offer_image.dart';
import 'package:gold_test/models/entities/offer/offer_property.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer' as dev;

@injectable
class OfferDetailsScreenState extends ChangeNotifier with LoadingStateSwitch {
  OfferDetailsScreenState({
    @factoryParam required this.barcode,
    required FetchOfferDetailedCase fetchOfferDetailedCase,
  }) : _fetchOfferDetailedCase = fetchOfferDetailedCase {
    refresh();
  }

  final String barcode;
  final FetchOfferDetailedCase _fetchOfferDetailedCase;
  OfferDetailed? _offer;
  final PageController _controller = PageController();
  int _activePageNumber = 0;
  bool _isShowEmptyStub = false;

  OfferDetailed? get offer => _offer;

  List<OfferImage> get offerImages => _offer?.images ?? [];

  List<OfferProperty> get offerProperties => _offer?.properties ?? [];

  PageController get controller => _controller;

  bool get isShowEmptyStub => _isShowEmptyStub;

  int get activePageNumber => _activePageNumber;

  int get currentPrice => _offer?.prices.firstOrNull?.price ?? 0;

  int? get oldPrice {
    final offer = this.offer;
    if (offer != null) {
      if (offer.prices.length > 1) {
        final oldPrice = offer.prices[1].price ?? 0;
        if (oldPrice != 0) return oldPrice;
      }
    }
    return null;
  }

  bool get isNotForSale {
    final offer = this.offer;
    if (offer != null) {
      if (offer.prices.isEmpty) return true;
      if (offer.prices.firstOrNull?.price == null) return true;
    }
    return false;
  }

  Future<void> refresh() async {
    await _fetchOfferDetailed();
  }

  Future<void> _fetchOfferDetailed() async {
    try {
      turnLoading(isOn: true);
      _offer = await _fetchOfferDetailedCase.run(barcode: barcode);
      turnLoading(isOn: false);
    } catch (error) {
      turnLoading(isOn: false);
      _isShowEmptyStub = true;
      if (error is Exception) dev.log('[Error]', error: error);
    }
  }

  void setPage(int page) {
    _controller.jumpToPage(page);
  }

  void setActivePageNumber(int pageNumber) {
    _activePageNumber = pageNumber;
    notifyListeners();
  }
}
