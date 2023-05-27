import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lol_draft/color_schemes.g.dart';
import 'package:lol_draft/main_controller.dart';
import 'package:lol_draft/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: MainPage(),
    );
  }
}
