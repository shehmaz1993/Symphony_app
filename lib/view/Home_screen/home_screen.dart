import 'package:flutter/material.dart';
import 'package:symphony_app/model/home/products_model_class.dart';
import 'package:symphony_app/res/assets/image_assets.dart';
import 'package:symphony_app/res/color/app_color.dart';
import 'package:symphony_app/utils/app_text_style/app_text_style.dart';
import 'package:symphony_app/view/Home_screen/trade_items_card.dart';
import 'package:get/get.dart';
import 'package:symphony_app/view_model/controller/home/home_view_model.dart';

import '../../data/response/status.dart';
import '../../res/components/General_exception_widget.dart';
import '../right_menu_bar/right_menu_bar_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.productListFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrayColor,
      appBar: buildAppBar(),
      endDrawer: RightDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderBanner(),
            buildSupportCard(),
            buildSectionTitle("Trending Items"),
            buildTrendingItemsSlider(),
            buildEntertainmentBanner(),
          ],
        ),
      ),
    );
  }

  /// **App Bar**
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.lightGrayColor,
      elevation: 0,
      title: const Text('My Symphony', style: AppTextStyles.heading),
      actions: [
        Builder( // Fix: Use Builder to get the right context
          builder: (context) => IconButton(
            icon: Image.asset(ImageAsset.appDrawer),
            onPressed: () {
              Scaffold.of(context).openEndDrawer(); // Opens right drawer
            },
          ),
        ),
      ],

    );
  }
//Image.asset(ImageAsset.appDrawer)
  /// **Header Banner**
  Widget buildHeaderBanner() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Obx(() {
            final headerImage = homeController.productList.value.data?.headerImage;
            return headerImage != null
                ? Image.asset(headerImage, fit: BoxFit.cover)
                : const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }

  /// **Support Card**
  Widget buildSupportCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Container(
        padding: const EdgeInsets.only(
                  left:25,right:25,top: 55,bottom: 55
           ),
        decoration: BoxDecoration(
          color: AppColor.redColor,
          borderRadius: BorderRadius.circular(12),
        ),
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
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Check Support", style: AppTextStyles.buttonText),
            ),
          ],
        ),
      ),
    );
  }

  /// **Section Title**
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  /// **Trending Items Slider**
  Widget buildTrendingItemsSlider() {
    return Obx(() {
      switch (homeController.rxRequestStatus.value) {
        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          return GeneralExceptionWidget(onPress: homeController.refreshApi);
        case Status.COMPLETED:
          List<Products> items = homeController.productList.value.data!.products!;
          return SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return TrendingItemCard(
                  items[index].name!,
                  items[index].image!,
                );
              },
            ),
          );
      }
    });
  }

  /// **Entertainment Banner**
  Widget buildEntertainmentBanner() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Obx(() {
            final entertainImage = homeController.productList.value.data?.entertainImage;
            return entertainImage != null
                ? Image.asset(entertainImage, fit: BoxFit.cover)
                : const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}

