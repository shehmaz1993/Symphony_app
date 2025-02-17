import 'package:flutter/material.dart';
import 'package:symphony_app/res/color/app_color.dart';
import 'package:symphony_app/utils/app_text_style/app_text_style.dart';
import 'package:get/get.dart';
import 'package:symphony_app/view_model/controller/social/social_view_model.dart';

import '../../data/response/status.dart';
class SocialScreen extends StatelessWidget {

  final socialController =Get.put(SocialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            _buildModelCard(),
            SizedBox(height: 20),
            _buildGamesSection(),
            SizedBox(height: 20),
            _buildSocialCommunityBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildModelCard() {

    return Obx(() {
      switch(socialController.rxRequestStatus.value){

        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          return const Center(child: Text('Something went wrong while loading data'));

        case Status.COMPLETED:
          return Container(
            padding: const EdgeInsets.only(top:16,bottom:16,right: 16,left: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(socialController.socialInfo.value.data!.modelImage!, width: 80, height: 80),
                    Text(
                        socialController.socialInfo.value.data!.modelName!,  // Replace 'Text' with whatever small text you want to display
                        style: AppTextStyles.subHeadingWhite70
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(socialController.socialInfo.value.data!.modelName!, style: AppTextStyles.boldWhiteHeading),
                      Text('Valid for ${socialController.socialInfo.value.data!.validity} Days', style: AppTextStyles.subHeadingWhite70),
                      Text('Expiry Date: ${socialController.socialInfo.value.data!.expireDate}', style: AppTextStyles.subHeadingWhite70),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: AppColor.redColor, size: 16),
              ],
            ),
          );
      }
    });

  }


  Widget _buildGamesSection() {
    List<String> gameImages = [
      'assets/images/image29.png',
      'assets/images/image30.png',
      'assets/images/image31.png',
      'assets/images/image41.jpg',
    ];
    return Obx(() {
      switch(socialController.rxRequestStatus.value){

        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          return const Center(child: Text('Something went wrong while loading data'));

        case Status.COMPLETED:
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Games', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text('See more', style: TextStyle(color: Colors.red))),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gameImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            height: 190,
                            width: 130,
                            child: Image.asset(gameImages[index], width: 100, height: 100, fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
      }
    });


  }

  Widget _buildSocialCommunityBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/sm1.png', width: double.infinity, height: 150, fit: BoxFit.cover),
          const Text(
            'JOIN SOCIAL COMMUNITY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
