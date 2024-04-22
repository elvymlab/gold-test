import 'package:flutter/material.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/content/offer_detailed_content.dart';
import 'package:gold_test/presentation/widgets/activity_indicator/activity_indicator.dart';
import 'package:provider/provider.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class OfferDetailedScreen extends StatelessWidget {
  const OfferDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<OfferDetailsScreenState>();
    return Scaffold(
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    final state = context.watch<OfferDetailsScreenState>();
    if (state.isShowEmptyStub) {
      return const Center(
        child: Text(
          texts.notFound,
          style: text_styles.medium18,
        ),
      );
    }
    if (state.isLoading) return const ActivityIndicator();
    return const OfferDetailedContent();
  }
}
