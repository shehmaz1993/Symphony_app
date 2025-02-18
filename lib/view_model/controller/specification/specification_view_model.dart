import 'package:symphony_app/model/specification/specification_model_class.dart';

import '../../../data/response/status.dart';
import 'package:get/get.dart';

import '../../../repository/specification_repository/specification_repository.dart';
class SpecificationController extends GetxController {

  final _api = SpecificationRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final specificInfo = SpecificationModelClass().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status status) => rxRequestStatus.value = status;

  void setSpecificInfo(SpecificationModelClass model) => specificInfo.value = model;

  void setError(String value) => error.value = value;

  @override
  void onInit() {
    super.onInit();
    specificInfoFromJson();
  }

  void specificInfoFromJson() {
    _api.specificationInfoFromJson().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print(value);
      setSpecificInfo(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.specificationInfoFromJson().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setSpecificInfo(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}