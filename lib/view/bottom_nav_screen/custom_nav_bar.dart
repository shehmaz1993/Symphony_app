import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), // Top-left rounded
          topRight: Radius.circular(20), // Top-right rounded
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/world-wide-web.png', width: 30, height: 30),
              activeIcon: Image.asset('assets/images/world-wide-web.png', width: 30, height: 30),
              label: 'Website',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/Vector.png', width: 30, height: 30),
              activeIcon: Image.asset('assets/images/Vector.png', width: 30, height: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/facebook.png', width: 30, height: 30),
              activeIcon: Image.asset('assets/images/facebook.png', width: 30, height: 30),
              label: 'Social',
            ),
          ],
        ),
      ),
    );
  }
}
