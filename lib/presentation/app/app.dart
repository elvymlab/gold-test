import 'dart:async';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_test/domain/storages/user/user_storage.dart';
import 'package:gold_test/env.dart';
import 'package:gold_test/presentation/navigation/navigators/app_navigator.dart';
import 'package:gold_test/presentation/widgets/app_message/manager/app_message_manager.dart';
import 'package:gold_test/presentation/widgets/app_message/model/app_message.dart';
import 'package:gold_test/presentation/widgets/custom_bottom_navigation_bar/bar/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/assets/colors.gen.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.environment,
  });

  final AppEnvironment environment;

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppEnvironment>.value(value: widget.environment),
        ChangeNotifierProvider<AppNavigator>.value(value: GetIt.I.get()),
        ChangeNotifierProvider.value(value: GetIt.I.get<UserStorage>()),
        Provider<StreamController<AppMessage>>.value(value: GetIt.I.get()),
      ],
      child: Builder(builder: (context) {
        final appNavigator = context.watch<AppNavigator>();
        return MaterialApp(
          theme: ThemeData(useMaterial3: false),
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('ru', 'RU')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          scaffoldMessengerKey: globalSnackBarKey,
          navigatorKey: appNavigator.appKey,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child ?? const SizedBox.shrink(),
            );
          },
          home: PopScope(
            onPopInvoked: (_) => appNavigator.onWillPop(),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: Container(
                color: UiKitColor.light,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: UiKitColor.white,
                    bottomNavigationBar: const CustomBottomNavigationBar(),
                    body: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        IndexedStack(
                          index: appNavigator.selectedTabIndex,
                          children: appNavigator.nestedNavigators,
                        ),
                        const AppMessageManager(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
