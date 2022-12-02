import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_app/common/routes.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/pages/splash/splash_page.dart';

void main() {
  runZonedGuarded(() async {
    await setupDI();
    runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '$SplashPage',
    );
  }
}
