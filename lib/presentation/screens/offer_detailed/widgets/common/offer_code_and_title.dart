import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:provider/provider.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class OfferCodeAndTitle extends StatelessWidget {
  const OfferCodeAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OfferDetailsScreenState>();
    final name = state.offer?.name;
    final brand = state.offer?.brand;
    final code = state.offer?.code;
    return Column(
      children: [
        if (name != null)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              name,
              style: text_styles.medium24,
            ),
          ),
        Row(
          children: [
            if (brand != null)
              Expanded(
                child: Text(
                  brand,
                  style: text_styles.medium14.copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: UiKitColor.grey02,
                    color: UiKitColor.black,
                  ),
                ),
              ),
            if (code != null)
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      style: text_styles.medium14.copyWith(color: UiKitColor.grey02),
                      children: [
                        const TextSpan(text: texts.code),
                        TextSpan(
                          text: code,
                          style: text_styles.medium14.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            color: UiKitColor.grey02,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
