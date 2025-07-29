import 'package:flutter/material.dart';

import '../../utils/color.dart';

abstract class DarkTheme {
  static ThemeData theme() => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    useMaterial3: true,
    scaffoldBackgroundColor: black,
    fontFamily: "Gilroy",
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      dividerHeight: 0,
      labelColor: primaryColor,
      unselectedLabelColor: Colors.grey,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
  );
}
