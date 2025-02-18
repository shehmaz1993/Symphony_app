import 'package:flutter/material.dart';
import 'package:symphony_app/res/assets/image_assets.dart';
import 'package:symphony_app/res/color/app_color.dart';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
class CheckSupportScreen extends StatelessWidget {
  final List<Map<String, dynamic>> supportOptions = [
    {'icon': ImageAsset.hotline, 'label': 'Hotline'},
    {'icon': ImageAsset.serviceCenter, 'label': 'Service Center'},
    {'icon': ImageAsset.lsqQuary, 'label': 'LSO Query'},
    {'icon': ImageAsset.feedBack, 'label': 'Feedback'},
    {'icon': ImageAsset.specification, 'label': 'Specification'},
    {'icon': ImageAsset.appointment, 'label': 'Book An Appointment'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Check Support',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.bluelight,
        elevation: 0,
      ),
      body: Container(
        color: AppColor.bluelight,
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: supportOptions.length,
          itemBuilder: (context, index) {
            return buildSupportCard(supportOptions[index]['icon'], supportOptions[index]['label']);
          },
        ),
      ),
    );
  }
  Widget buildSupportCard(String icon,String label){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColor.bluelightShade, width: 2),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteName.lsoSupport);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
