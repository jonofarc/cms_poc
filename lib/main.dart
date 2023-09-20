import 'package:cms_pocs/generated/l10n.dart';
import 'package:cms_pocs/presentation/pages/login_screen.dart';
import 'package:cms_pocs/shared/utils/app_utils.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  S.load(Locale('es', 'MX'));
    return MaterialApp(
      supportedLocales: S.delegate.supportedLocales,
      locale: View.of(context).platformDispatcher.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate, // Add this delegate
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Add this delegate
      ],
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: appFontFamily,
        scaffoldBackgroundColor: const Color(0xFFe6e6e6),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppUtils().getDefaultAppbar(context),
        body: const LoginScreen(),
      ),
    );
  }
}
