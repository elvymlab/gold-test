import 'package:flutter/material.dart';
import 'package:gold_test/presentation/screens/offer_detailed/state/offer_detailed_screen_state.dart';
import 'package:gold_test/presentation/screens/offer_detailed/widgets/image_slider/page_indicator.dart';
import 'package:gold_test/presentation/widgets/network_image/safe_cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class OfferMediaPageView extends StatefulWidget {
  const OfferMediaPageView({Key? key}) : super(key: key);

  @override
  State createState() => _OfferMediaPageViewState();
}

class _OfferMediaPageViewState extends State<OfferMediaPageView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final storage = context.watch<OfferDetailsScreenState>();
    return Container(
      color: UiKitColor.light,
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            allowImplicitScrolling: true,
            controller: storage.controller,
            onPageChanged: storage.setActivePageNumber,
            itemCount: storage.offerImages.length,
            itemBuilder: (_, index) {
              final offerImage = storage.offerImages[index];
              return SafeCachedNetworkImage(
                imageUrl: offerImage.path,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.cover,
              );
            },
          ),
          if (storage.offerImages.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: PageIndicator(
                  activePageIndex: storage.activePageNumber,
                  pagesCount: storage.offerImages.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
