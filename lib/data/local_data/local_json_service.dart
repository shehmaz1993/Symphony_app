import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:symphony_app/data/local_data/base_local_data_services.dart';

class LocalJsonService extends BaseLocalDataServices{
  @override
  Future getLocalJson(String filePath) async {
    dynamic responseJson;
    try {
      // Load JSON file from assets
      final String jsonString = await rootBundle.loadString(filePath);

      // Decode JSON string to Map or List
      responseJson = jsonDecode(jsonString);

    } on FormatException {
      throw const FormatException("Invalid JSON format");
    } on FlutterError {
      throw FlutterError("Failed to load asset: $filePath");
    }
    return responseJson;
  }

  
}