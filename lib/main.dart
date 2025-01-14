import 'package:coach_me/config/dependencies.dart';
import 'package:coach_me/routing/router.dart';
import 'package:coach_me/ui/core/localization/applocalization.dart';
import 'package:coach_me/ui/core/themes/theme.dart';
import 'package:coach_me/ui/core/ui/scroll.behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: providersLocal,
        child: const App(),
      ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      scrollBehavior: AppCustomScrollBehavior(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router(context.read()),
    );
  }
}