import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/common/offer_code_and_title.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/common/offer_properties.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/image_slider/offer_images_slider.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/price/offer_price.dart';
import 'package:provider/provider.dart';

class OfferDetailedContent extends StatelessWidget {
  const OfferDetailedContent({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<OfferDetailsScreenState>();
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 360,
              child: OfferMediaPageView(),
            ),
            OfferCodeAndTitle(),
            OfferPriceWidget(),
            OfferProperties(),
          ],
        ),
      ),
    );
  }
}
