import 'package:flutter/material.dart';
import 'package:symphony_app/model/social/social_section_model_class.dart';
import 'package:symphony_app/repository/social_repository/social_repository.dart';

import '../../../data/response/status.dart';
import 'package:get/get.dart';
class SocialController extends GetxController {

  final _api = SocialRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final socialInfo = SocialSectionModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status status) => rxRequestStatus.value = status;

  void setSocialInfoList(SocialSectionModel model) => socialInfo.value = model;

  void setError(String value) => error.value = value;

  @override
  void onInit() {
    super.onInit();
    socialInfoFromJson();
  }

  void socialInfoFromJson() {
    _api.socialInfoFromJson().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print(value);
      setSocialInfoList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.socialInfoFromJson().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setSocialInfoList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}