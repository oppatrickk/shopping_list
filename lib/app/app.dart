import 'package:flutter/material.dart';
import 'package:shopping_list/features/home/presentation/views/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2b6a46)),
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
