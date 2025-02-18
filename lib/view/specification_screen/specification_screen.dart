import 'package:flutter/material.dart';
import 'package:symphony_app/res/assets/image_assets.dart';
import 'package:symphony_app/res/color/app_color.dart';
import 'package:symphony_app/utils/app_text_style/app_text_style.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../view_model/controller/specification/specification_view_model.dart';
class SpecificationScreen extends StatelessWidget {
   SpecificationScreen({super.key});
  final specificationController = Get.put(SpecificationController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        title: const Text('Device Specification',style:AppTextStyles.boldWhiteHeading ,),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: AppColor.redColor,), // Change to any icon you want
          onPressed: () {
            // Action for the button
            Get.back();
          },
        ),
      ),
      body: Obx(() {

        switch (specificationController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return const Center(child: Text('Something went wrong while loading data'));
          case Status.COMPLETED:
            var item =specificationController.specificInfo.value.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopLongSection('Powered by', 'Android™ 14'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildShortSection(
                        title: 'Processor',
                        content: item.processor!.content!,
                        image: ImageAsset.processor,
                      ),
                      const SizedBox(width: 12),
                      _buildShortSection(
                        title: 'Storage',
                        content: item.storage!.content!,
                        image: ImageAsset.storage,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLongSection(
                    title: 'Display',
                    content: item.display!.content!,
                    image: ImageAsset.display,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildShortSection(
                        title: 'RAM',
                        content: item.ram!.content!,
                        image: ImageAsset.ram,
                      ),
                      const SizedBox(width: 12),
                      _buildShortSection(
                        title: 'Sim Card',
                        content: item.simCard!.content!,
                        image: ImageAsset.simCard,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLongSection(
                    title: 'Camera',
                    content: item.camera!.content!,
                    image: ImageAsset.camera,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildShortSection(
                        title: 'Network',
                        content: item.network!.content!,
                        image: ImageAsset.network,
                      ),
                      const SizedBox(width: 12),
                      _buildShortSection(
                        title: 'Battery',
                        content: item.battery!.content!,
                        image: ImageAsset.battery,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLongSection(
                    title: 'Device Sensors',
                    content: item.deviceSensors!.content!,
                    image: ImageAsset.fingerPrint,
                  ),
                ],
              ),
            );
        }
      })
    );
  }

  // Optimized widget builder for short sections
  Widget _buildShortSection({
    required String title,
    required String content,
    required String image,
  }) {
    return SizedBox(
      height: Get.height*.25,
      width: Get.width*0.442,
      child: Card(
        color: AppColor.grayColor850,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(image),
              const SizedBox(height: 8),
              Text(
                title,
                style: AppTextStyles.subHeadingWhite70,
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: AppTextStyles.boldWhiteSubHeading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Optimized widget builder for top long sections
  Widget _buildTopLongSection(String title, String content) {
    return Card(
      color: AppColor.grayColor850,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.subHeadingWhite70,
                ),
                const SizedBox(height: 8),
                Image.asset('assets/images/Frame4.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30.0,right: 10),
            child: Image.asset('assets/images/image49.png'),
          ),
        ],
      ),
    );
  }

  // Optimized widget builder for long sections
  Widget _buildLongSection({
    required String title,
    required String content,
    required String image,
  }) {
    return Card(
      color: AppColor.grayColor850,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, height: 27, width: 27),
              const SizedBox(height: 8),
              Text(
                title,
                style: AppTextStyles.subHeadingWhite70,
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: AppTextStyles.boldWhiteSubHeading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
