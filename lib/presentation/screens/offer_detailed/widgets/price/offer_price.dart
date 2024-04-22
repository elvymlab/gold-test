import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/formatters/price_formatter.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;
import 'package:gold_test/resources/texts.dart' as texts;

class OfferPriceWidget extends StatelessWidget {
  const OfferPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OfferDetailsScreenState>();
    return state.isNotForSale
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              texts.offerNotForSale,
              style: text_styles.extraBold18,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 36),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: UiKitColor.grey01,
              ),
              child: Row(
                children: [
                  Text(
                    PriceFormatter().format(state.currentPrice),
                    style: text_styles.semiBold18,
                  ),
                  const SizedBox(width: 8),
                  if (state.oldPrice != null)
                    Text(
                      PriceFormatter().format(state.oldPrice),
                      style: text_styles.regular16.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                ],
              ),
            ),
          );
  }
}
