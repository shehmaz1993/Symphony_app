import 'package:flutter/material.dart';
import 'package:symphony_app/view/Home_screen/home_screen.dart';

import 'package:symphony_app/view/web_screen/web_service_screen.dart';

import '../social_screen/social_screen.dart';
import 'custom_nav_bar.dart';

class StackedScreens extends StatefulWidget {
  const StackedScreens({super.key});

  @override
  State<StackedScreens> createState() => _StackedScreensState();
}

class _StackedScreensState extends State<StackedScreens> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
     const WebServiceScreen(title: "WebSite",url: 'https://www.symphony-mobile.com/',),
     const HomeScreen(),
     SocialScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // Keeps state alive while switching
        children: _screens,
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      )
    );
  }
}
