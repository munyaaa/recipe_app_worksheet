import 'package:flutter/material.dart';
import 'package:recipe_app_worksheet/pages/main/main_page.dart';

void main() {
  // TODO 01: register DI
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF85633),
          primary: const Color(0xFFF85633),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
