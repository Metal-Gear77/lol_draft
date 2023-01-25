import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme:
            ThemeData(useMaterial3: true,  colorScheme: darkColorScheme),
        initialRoute: "/",
        getPages: [
          GetPage(
              name: "/",
              page: () => MainPage(),
              binding: BindingsBuilder(() {
                Get.put(MainController());
              })),
        ]);
  }
}
