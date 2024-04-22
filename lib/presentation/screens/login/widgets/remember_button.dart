import 'package:flutter/cupertino.dart';
import 'package:gold_test/presentation/screens/login/state/login_screen_state.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class RememberButton extends StatelessWidget {
  const RememberButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginScreenState>();
    final assets = state.isRememberCheck ? Assets.images.iconCheckbox : Assets.images.iconEmptyCheckbox;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: state.checkRemember,
      child: Row(
        children: [
          assets.image(height: 24, width: 24),
          const SizedBox(width: 14),
          const Text(
            texts.authorizationScreenRememberMe,
            style: text_styles.medium13,
          )
        ],
      ),
    );
  }
}
