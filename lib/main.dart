import 'package:flutter/material.dart';
import 'package:symphony_app/view/bottom_nav_screen/stacked_screens.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StackedScreens(),
    );
  }
}

