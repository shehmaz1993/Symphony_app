import 'package:flutter/material.dart';
import 'package:symphony_app/view/Home_screen/trade_items_card.dart';

import 'home_screen.dart';
class TradingItemsScreen extends StatefulWidget {
  @override
  _TradingItemsScreenState createState() => _TradingItemsScreenState();
}

class _TradingItemsScreenState extends State<TradingItemsScreen> {
  late PageController _controller;

  // Example of dynamic list (you can replace this with your actual data source)
  List<Map<String, String>> trendingItems = [
    {"title": "Mobiles", "imageUrl": "assets/images/mobile"},
    {"title": "Watches", "imageUrl": "asstes/images/watch"},
    {"title": "Accessories", "imageUrl": "assets/images/accessories"},
    // Add more items here dynamically
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: 0.8, // Adjust for spacing between cards
    );

    // Optionally auto-scroll the PageView
    Future.delayed(Duration(seconds: 2), _autoScroll);
  }

  void _autoScroll() {
    if (_controller.hasClients) {
      int nextPage = (_controller.page?.round() ?? 0) + 1;
      if (nextPage >= trendingItems.length) nextPage = 0; // Loop back to first page
      _controller.animateToPage(
        nextPage,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: trendingItems.length, // Dynamic list length
            itemBuilder: (context, index) {
              final item = trendingItems[index];
              return TrendingItemCard(item["title"]!, item["imageUrl"]!);
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}