import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:symphony_app/navber.dart';
import 'package:symphony_app/view/stacked_screens/stacked_screens.dart';
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
      home: NavBar(),
    );
  }
}

