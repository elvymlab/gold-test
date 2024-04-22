import 'package:flutter/material.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.activePageIndex,
    required this.pagesCount,
  }) : super(key: key);
  final int activePageIndex;
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 10,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: pagesCount,
        itemBuilder: (_, index) {
          final isActive = index == activePageIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: UiKitColor.black),
                color: UiKitColor.white,
              ),
              child: isActive
                  ? Center(
                      child: SizedBox(
                        height: 3,
                        width: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: UiKitColor.black,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
