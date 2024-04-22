import 'package:flutter/material.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/assets/colors.gen.dart';

import 'package:ui_kit/text_styles/buttons.dart' as buttons_styles;

const double _defaultHeight = 48;
const double _defaultBorderRadius = 6;
const EdgeInsets _defaultPadding = EdgeInsets.symmetric(horizontal: 16);

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.style,
    required this.content,
    required this.onPressed,
    this.height = _defaultHeight,
    this.padding = _defaultPadding,
    this.borderRadiusValue = _defaultBorderRadius,
  }) : super(key: key);

  final ActionButtonStyle style;
  final ActionButtonContent content;
  final void Function() onPressed;
  final double _iconSize = 24;
  final double height;
  final EdgeInsets padding;
  final double borderRadiusValue;

  factory ActionButton.primary(
    String title, {
    required void Function() onPressed,
    double height = _defaultHeight,
    double borderRadius = _defaultBorderRadius,
  }) {
    return ActionButton(
      style: ActionButtonStyle.primary,
      content: ActionButtonContent.title(title),
      onPressed: onPressed,
      height: height,
      borderRadiusValue: borderRadius,
    );
  }

  factory ActionButton.white(
    String title, {
    required void Function() onPressed,
    double height = _defaultHeight,
    AssetGenImage? asset,
    TextStyle textStyle = buttons_styles.medium16,
    TitleAndIconOrder order = TitleAndIconOrder.titleFirst,
    EdgeInsets contentPadding = _defaultPadding,
    double borderRadius = _defaultBorderRadius,
  }) {
    return ActionButton(
      style: ActionButtonStyle.white,
      padding: contentPadding,
      borderRadiusValue: borderRadius,
      content: asset != null
          ? ActionButtonContent.titleAndIcon(
              title: title,
              asset: asset,
              textStyle: textStyle,
              order: order,
            )
          : ActionButtonContent.title(
              title,
              textStyle: textStyle,
            ),
      onPressed: onPressed,
      height: height,
    );
  }

  factory ActionButton.bordered(
    String title, {
    required void Function() onPressed,
    double height = _defaultHeight,
    double borderRadius = _defaultBorderRadius,
  }) {
    return ActionButton(
      style: ActionButtonStyle.bordered,
      content: ActionButtonContent.title(title),
      onPressed: onPressed,
      height: height,
      borderRadiusValue: borderRadius,
    );
  }

  factory ActionButton.unbordered(
    String title, {
    required void Function() onPressed,
    double height = _defaultHeight,
    double borderRadius = _defaultBorderRadius,
  }) {
    return ActionButton(
      style: ActionButtonStyle.unbordered,
      content: ActionButtonContent.title(title),
      onPressed: onPressed,
      height: height,
      borderRadiusValue: borderRadius,
    );
  }

  factory ActionButton.disabled(
    String title, {
    double height = _defaultHeight,
    double borderRadius = _defaultBorderRadius,
  }) {
    return ActionButton(
      style: ActionButtonStyle.disabled,
      content: ActionButtonContent.title(title),
      onPressed: () {},
      height: height,
      borderRadiusValue: borderRadius,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        height: height,
        decoration: _makeDecoration(style: style),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: Center(
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (content.runtimeType) {
      case TitleActionButtonContent:
        return _buildOnlyTitleContent();
      case TitleAndIconActionButtonContent:
        return _buildIconAndTitlePairContent();
      default:
        throw Exception('Неизвестный стиль контента');
    }
  }

  Widget _buildOnlyTitleContent() {
    final content = this.content as TitleActionButtonContent;
    return SizedBox(width: double.infinity, child: _buildText(content));
  }

  Widget _buildIconAndTitlePairContent() {
    final content = this.content as TitleAndIconActionButtonContent;
    switch (content.order) {
      case TitleAndIconOrder.iconFirst:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            content.asset.image(
              color: content.color,
              height: _iconSize,
              width: _iconSize,
            ),
            SizedBox(width: content.spacing),
            _buildText(content),
          ],
        );
      case TitleAndIconOrder.titleFirst:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildText(content),
            SizedBox(width: content.spacing),
            content.asset.image(
              color: content.color,
              height: _iconSize,
              width: _iconSize,
            ),
          ],
        );
    }
  }

  Widget _buildText(ActionButtonContent content) {
    final Color color;
    switch (style) {
      case ActionButtonStyle.primary:
      case ActionButtonStyle.bordered:
        color = UiKitColor.white;
        break;
      case ActionButtonStyle.white:
        color = UiKitColor.black;
        break;
      case ActionButtonStyle.unbordered:
        color = UiKitColor.black;
        break;
      case ActionButtonStyle.disabled:
        color = UiKitColor.dark;
    }
    return Text(
      content.title,
      style: content.textStyle.copyWith(color: color),
      textAlign: TextAlign.center,
    );
  }

  BoxDecoration _makeDecoration({required ActionButtonStyle style}) {
    final borderRadius = BorderRadius.circular(borderRadiusValue);
    switch (style) {
      case ActionButtonStyle.primary:
        return BoxDecoration(
          color: UiKitColor.primary,
          borderRadius: borderRadius,
        );
      case ActionButtonStyle.bordered:
        return BoxDecoration(
            color: UiKitColor.primary,
            border: Border.all(color: UiKitColor.black),
            borderRadius: borderRadius,
            boxShadow: const [
              BoxShadow(
                color: UiKitColor.grey02,
                offset: Offset(0, 2.0),
                blurRadius: 4.0,
              )
            ]);
      case ActionButtonStyle.white:
        return BoxDecoration(
          color: UiKitColor.white,
          borderRadius: borderRadius,
        );
      case ActionButtonStyle.unbordered:
        return BoxDecoration(
          color: UiKitColor.primary,
          borderRadius: borderRadius,
        );
      case ActionButtonStyle.disabled:
        return BoxDecoration(
          color: UiKitColor.grey03,
          borderRadius: borderRadius,
        );
    }
  }
}

enum ActionButtonStyle { primary, white, bordered, unbordered, disabled }

enum TitleAndIconOrder { titleFirst, iconFirst }

abstract class ActionButtonContent {
  ActionButtonContent._(this.title, this.textStyle);

  final String title;
  final TextStyle textStyle;

  factory ActionButtonContent.title(
    String title, {
    TextStyle textStyle = buttons_styles.medium16,
  }) {
    return TitleActionButtonContent(title, textStyle);
  }

  factory ActionButtonContent.titleAndIcon({
    required String title,
    required AssetGenImage asset,
    double spacing = 8,
    Color? color,
    TitleAndIconOrder order = TitleAndIconOrder.iconFirst,
    TextStyle textStyle = buttons_styles.medium16,
  }) {
    return TitleAndIconActionButtonContent(
      title,
      textStyle,
      asset: asset,
      order: order,
      color: color,
    );
  }
}

class TitleActionButtonContent extends ActionButtonContent {
  TitleActionButtonContent(super.title, super.textStyle) : super._();
}

class TitleAndIconActionButtonContent extends ActionButtonContent {
  TitleAndIconActionButtonContent(
    super.title,
    super.texyStyle, {
    required this.order,
    required this.asset,
    this.spacing = 8,
    this.color,
  }) : super._();

  final TitleAndIconOrder order;
  final AssetGenImage asset;
  final double spacing;
  final Color? color;
}
