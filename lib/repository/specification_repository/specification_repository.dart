import 'package:symphony_app/model/specification/specification_model_class.dart';

import '../../data/local_data/local_json_service.dart';
import '../../res/app_url/app_url.dart';

class SpecificationRepository{

  final _jsonService = LocalJsonService();

  Future<SpecificationModelClass> specificationInfoFromJson()async{
    dynamic response = await _jsonService.getLocalJson(AppUrl.specificationString);
    print(response);
    return SpecificationModelClass.fromJson(response);
  }



}