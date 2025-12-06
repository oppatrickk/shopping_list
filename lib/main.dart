import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list/app/app.dart';
import 'package:shopping_list/app/bootstrap.dart';
import 'package:shopping_list/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // ignore: deprecated_member_use
      systemNavigationBarColor: Colors.black.withOpacity(0.002),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  configureDependencies();
  await bootstrap(() => const AppWidget());
}
