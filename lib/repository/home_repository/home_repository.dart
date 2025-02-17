


import '../../data/local_data/local_json_service.dart';
import '../../model/home/products_model_class.dart';
import '../../res/app_url/app_url.dart';

class HomeRepository{

  final _jsonService = LocalJsonService();

  Future<ProductModel> productListFromJson()async{
    dynamic response = await _jsonService.getLocalJson(AppUrl.jsonString);

    return ProductModel.fromJson(response);
  }



}