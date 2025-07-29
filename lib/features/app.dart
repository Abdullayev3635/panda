import 'package:panda_test/core/themes/dark.dart';

import 'package:flutter/material.dart';

import '../core/routing/my_router.dart';
import '../core/themes/light.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Panda',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme(),
      darkTheme: DarkTheme.theme(),
      themeMode: ThemeMode.light,
      routerConfig: Routing.router,
    );
  }
}
