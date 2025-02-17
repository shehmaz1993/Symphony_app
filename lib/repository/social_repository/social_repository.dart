import 'package:symphony_app/model/social/social_section_model_class.dart';

import '../../data/local_data/local_json_service.dart';
import '../../res/app_url/app_url.dart';

class SocialRepository{

  final _jsonService = LocalJsonService();

  Future<SocialSectionModel> socialInfoFromJson()async{
    dynamic response = await _jsonService.getLocalJson(AppUrl.socialString);

    return SocialSectionModel.fromJson(response);
  }



}