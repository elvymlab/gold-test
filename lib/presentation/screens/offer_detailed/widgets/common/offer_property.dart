import 'package:flutter/cupertino.dart';
import 'package:gold_test/models/entities/offer/offer_property.dart';
import 'package:gold_test/presentation/widgets/dots_spacer/dots_spacer.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class OfferPropertyWidget extends StatelessWidget {
  const OfferPropertyWidget({
    super.key,
    required this.property,
  });

  final OfferProperty property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            property.name,
            style: text_styles.regular14.copyWith(
              decorationColor: UiKitColor.grey02,
            ),
          ),
          const DotsSpacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              property.value,
              style: text_styles.medium14.copyWith(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                color: UiKitColor.black,
                decorationColor: UiKitColor.grey02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
