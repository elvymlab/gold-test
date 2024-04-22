import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class CustomBottomBarTab extends StatelessWidget {
  const CustomBottomBarTab({
    Key? key,
    required this.title,
    required this.asset,
    required this.index,
    this.badgeValue = 0,
  }) : super(key: key);

  final String title;
  final AssetGenImage asset;
  final int index;
  final int badgeValue;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppNavigator>();
    final isSelected = state.selectedTabIndex == index;
    return Expanded(
      child: CupertinoButton(
        onPressed: () => state.selectedTabIndex = index,
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: asset.image(
                color: UiKitColor.white,
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: isSelected
                  ? text_styles.medium8.copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.w600)
                  : text_styles.medium8,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
