import 'package:flutter/material.dart';
import 'package:symphony_app/res/assets/image_assets.dart';
import 'package:symphony_app/res/color/app_color.dart';
class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColor.whiteColor,  // Set background color for the drawer
        width: 250,  // Custom width for the "bar"
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Image.asset(ImageAsset.symphonyImage),
              ),
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}