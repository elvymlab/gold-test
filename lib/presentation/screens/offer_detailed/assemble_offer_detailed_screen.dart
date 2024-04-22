import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/presentation/screens/offer_detailed/offer_detailed_screen.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:provider/provider.dart';

MaterialPageRoute assembleOfferDetailedScreen({required String barcode}) {
  return MaterialPageRoute(
    builder: (_) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => GetIt.I.get<OfferDetailsScreenState>(param1: barcode),
          ),
        ],
        child: const OfferDetailedScreen(),
      );
    },
  );
}
