import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:symphony_app/data/local_data/base_local_data_services.dart';

import '../app_exceptions.dart';

class LocalJsonService extends BaseLocalDataServices{
  @override
  Future<dynamic> getLocalJson(String filePath) async {
    dynamic responseJson;
    try {
      // Load JSON file from assets
      final String jsonString = await rootBundle.loadString(filePath);

      // Decode JSON string to Map or List
      responseJson = jsonDecode(jsonString);

    } catch (e) {
      if (e is FlutterError) {
        throw FileNotFoundException('Could not find the file at $filePath');
      } else if (e is FormatException) {
        throw JsonParsingException('Invalid JSON format in $filePath');
      } else {
        throw AssetLoadException('Failed to load asset: $filePath');
      }
    }
    return responseJson;
  }

  
}