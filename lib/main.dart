import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:digicoach/locale_provider.dart';
import 'package:digicoach/src/common/constants/strings.dart';
import 'package:digicoach/src/routes/router.dart';
import 'package:digicoach/src/themes/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statusbarz/statusbarz.dart';

import 'app_localization.dart';
import 'src/common/service/shared_pref_provider.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefProvider.initialize();
  Firebase.initializeApp();
  //initializeDateFormatting().then((_) =>
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
  //);
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return StatusbarzCapturer(
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(appRouter),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        locale: ref.watch(localeProvider),
        supportedLocales: supportedLocale.map((e) => Locale(e)).toList(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
