import 'package:flutter/material.dart';
class TrendingItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  TrendingItemCard(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: 120, // Fixed width
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // Ensure the full box has rounded corners
        border: Border.all(color: Colors.grey.shade300), // Add a border to make sure it's visible
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 45.0),
          Padding(
            padding: EdgeInsets.only(left: title=='Mobiles'?20.0:40.0,right:title=='Mobiles'?20.0:0.0 ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Ensure image also has rounded corners
              child: Image.asset(imageUrl, width: 92, height: 92, fit: BoxFit.cover),
            ),
          ),
        //  SizedBox(height: 8), // Add spacing to prevent cut-off
        ],
      ),
    );
  }
}
