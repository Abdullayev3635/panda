import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/routing/my_router.dart';
import 'features/app.dart';

void main() {
  runZonedGuarded(
    () async {
      Routing.instance;

      WidgetsFlutterBinding.ensureInitialized();
      runApp(MyApp());
    },
    (error, stacktrace) async {
      if (error.runtimeType != OSError &&
          error.runtimeType != AssertionError &&
          !kDebugMode) {
        debugPrint(error.toString());
      }
    },
  );
}
