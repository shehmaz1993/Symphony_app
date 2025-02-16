import 'package:flutter/material.dart';
import 'package:symphony_app/res/assets/image_assets.dart';
import 'package:symphony_app/res/color/app_color.dart';
import 'package:symphony_app/utils/app_text_style/app_text_style.dart';
import 'package:symphony_app/view/Home_screen/trade_items_card.dart';
import 'package:symphony_app/view/Home_screen/trading_items_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 0;
  final List<Map<String, String>> trendingItems = [
    {"title": "Mobiles", "imageUrl": "assets/images/mobile.png"},
    {"title": "Watches", "imageUrl": "assets/images/watch.png"},
    {"title": "Accessories", "imageUrl": "assets/images/accessories.png"},
    {"title": "Head Phones", "imageUrl": "assets/images/headphones.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightGrayColor, // Match AppBar background
        appBar: AppBar(
        backgroundColor:  AppColor.lightGrayColor, // Same as Scaffold background
        elevation: 0,
        title: const Text('My Symphony',style: AppTextStyles.heading,),
        actions: [
          IconButton(
            onPressed: () async {

            },
            icon: Image.asset(ImageAsset.appDrawer)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(ImageAsset.homeheader, fit: BoxFit.cover),
                ),
              ),
            ),

            // Support Card
            buildSupportCard(),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Trending items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            // Trending Items List
            const SizedBox(height: 10),
            buildTrendingItemsSlider(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Entertainment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            // Entertainment Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(ImageAsset.entertain, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTrendingItemsSlider(){
    return SizedBox(
      height: 180, // Define fixed height to avoid layout issues
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: trendingItems.length,
        itemBuilder: (context, index) {
          return TrendingItemCard(
            trendingItems[index]["title"]!,
            trendingItems[index]["imageUrl"]!,
          );
        },
      ),
    );
  }
  Widget buildSupportCard(){
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.redColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.headset_mic, color: Colors.white, size: 32),
                  SizedBox(width: 10),
                  Text("Need Help?", style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Adjust value for more/less rounding
                  ),
                ),
                child: const Text(
                  "Check Support",
                  style: AppTextStyles.buttonText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

