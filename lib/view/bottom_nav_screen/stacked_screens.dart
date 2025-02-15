import 'package:flutter/material.dart';
import 'package:symphony_app/view/Home_screen/home_screen.dart';
import 'package:symphony_app/view/bottom_nav_screen/custom_nav_bar.dart';
import 'package:symphony_app/view/sicial_media%20page/social_media_page.dart';
import 'package:symphony_app/view/web_screen/web_service_screen.dart';

class StackedScreens extends StatefulWidget {
  const StackedScreens({super.key});

  @override
  State<StackedScreens> createState() => _StackedScreensState();
}

class _StackedScreensState extends State<StackedScreens> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const WebServiceScreen(),
    const HomeScreen(),
    const SocialServiceScreen()
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
