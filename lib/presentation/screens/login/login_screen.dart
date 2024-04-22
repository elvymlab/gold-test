import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold_test/presentation/screens/login/state/login_screen_state.dart';
import 'package:gold_test/presentation/screens/login/widgets/login_field.dart';
import 'package:gold_test/presentation/screens/login/widgets/password_field.dart';
import 'package:gold_test/presentation/screens/login/widgets/remember_button.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:gold_test/resources/texts.dart' as texts;
import 'package:ui_kit/assets/colors.gen.dart';
import 'package:ui_kit/validators/form_field_validator.dart';
import 'package:ui_kit/widgets/buttons/action_button.dart';
import 'package:ui_kit/widgets/shadows/shadows.dart';
import 'package:ui_kit/text_styles/texts.dart' as text_styles;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final loginController = TextEditingController();
  final _validationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginScreenState>();
    return Scaffold(
      backgroundColor: UiKitColor.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 23),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Assets.images.imageProfile.image(
                    height: 190,
                    width: 190,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      texts.authorizationScreenTitle,
                      style: text_styles.extraBold18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      texts.authorizationScreenDescription,
                      style: text_styles.regular13,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _validationFormKey,
                    child: AutofillGroup(
                      child: Column(
                        children: [
                          LoginField(
                            controller: loginController,
                            validator: Validator.notEmptyValue().check,
                          ),
                          const SizedBox(height: 4),
                          PasswordField(
                            controller: passwordController,
                            validator: Validator.notEmptyValue().check,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const RememberButton(),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      // margin: EdgeInsets.only(top: 22, bottom: 22),
                      decoration: BoxDecoration(
                        boxShadow: Shadows().bottomGrey,
                      ),
                      child: ActionButton.bordered(
                        texts.authorizationScreenLoginBtn,
                        onPressed: () async => await _onPressLogin(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: state.onFogotPasswordPressed,
                    child: const Text(
                      texts.authorizationScreenFogotPassword,
                      style: text_styles.medium14,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressLogin(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    TextInput.finishAutofillContext();
    final streamController = context.read<StreamController<AppMessage>>();
    final routeNavigator = Navigator.of(context);
    final isValid = _validationFormKey.currentState?.validate() ?? false;
    if (isValid) {
      final state = context.read<LoginScreenState>();
      try {
        state.turnLoading(isOn: true);
        final result = await state.authorize(
          login: loginController.text,
          password: passwordController.text,
        );
        state.turnLoading(isOn: false);
        routeNavigator.pop(result);
      } catch (error) {
        state.turnLoading(isOn: false);
        state.handleError(error, streamController: streamController);
      }
    }
  }
}
