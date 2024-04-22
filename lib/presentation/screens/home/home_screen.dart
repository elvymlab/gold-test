import 'package:gold_test/presentation/screens/home/state/home_screen_state.dart';
import 'package:gold_test/presentation/widgets/activity_indicator/activity_indicator.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;
import 'package:ui_kit/text_styles/buttons.dart' as buttons_styles;
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/widgets/buttons/action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeScreenState>();
    final userName = state.user?.name;
    final division = state.user?.division;
    final post = state.user?.post;

    return Scaffold(
      body: state.isLoading
          ? const ActivityIndicator()
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  color: UiKitColor.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  color: UiKitColor.primary,
                ),
                Positioned(
                  left: 175,
                  bottom: MediaQuery.of(context).size.height * 0.08,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (userName != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              userName,
                              style: text_styles.bold24,
                            ),
                          ),
                        if (post != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(post, style: text_styles.semiBoldItalic14),
                          ),
                        if (division != null)
                          Text(
                            division,
                            style: text_styles.italic14,
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12,
                  ),
                  child: Row(
                    children: [
                      Assets.images.imageProfile.image(
                        height: 190,
                        width: 190,
                      ),
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, right: 10),
                    alignment: Alignment.topRight,
                    child: IntrinsicWidth(
                      child: SizedBox(
                        height: 24,
                        child: ActionButton.white(
                          texts.homeScreenLogout,
                          asset: Assets.images.iconExit,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                          textStyle: buttons_styles.regular12,
                          borderRadius: 3,
                          onPressed: state.logout,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
