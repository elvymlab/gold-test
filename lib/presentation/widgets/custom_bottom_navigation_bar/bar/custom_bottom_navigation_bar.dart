import 'package:flutter/material.dart';
import 'package:gold_test/presentation/widgets/custom_bottom_navigation_bar/tab/custom_bottom_navigation_bar_tab.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:gold_test/presentation/navigation/navigation_stack_indexes.dart' as tab_indexes;
import 'package:gold_test/resources/texts.dart' as texts;

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: UiKitColor.primary,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: UiKitColor.grey03,
            offset: Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomBottomBarTab(
            title: texts.homeTabName,
            asset: Assets.images.iconHome,
            index: tab_indexes.home,
          ),
          CustomBottomBarTab(
            title: texts.scanTabName,
            asset: Assets.images.iconScan,
            index: tab_indexes.scan,
          ),
          CustomBottomBarTab(
            title: texts.mapTabName,
            asset: Assets.images.iconMap,
            index: tab_indexes.map,
          ),
        ],
      ),
    );
  }
}
