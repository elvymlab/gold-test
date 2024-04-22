import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/common/offer_property.dart';
import 'package:provider/provider.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class OfferProperties extends StatelessWidget {
  const OfferProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OfferDetailsScreenState>();
    final properties = state.offerProperties;
    final code = state.offer?.code;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            texts.offerPropertiesTitle,
            style: text_styles.medium24,
          ),
        ),
        if (code != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              '${texts.offerCode} $code',
              style: text_styles.regular14.copyWith(color: UiKitColor.grey02),
            ),
          ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final property = properties[index];
            return OfferPropertyWidget(property: property);
          },
          itemCount: properties.length,
        ),
        const SizedBox(height: 26),
      ],
    );
  }
}
