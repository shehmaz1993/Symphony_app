import 'package:flutter/material.dart';

class SpecificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Specification'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLongSection('Powered by', 'Android™ 14'),
            SizedBox(height: 20),
            _buildLongSection('Processor', 'MediaTek Helio G99\n6nm, 2.2GHz Octa-core'),
            SizedBox(height: 20),
            _buildLongSection('Storage', 'ROM 128GB'),
          ],
        ),
      ),

    );
  }

  Widget _buildLongSection(String title, String content) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(content, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

}
