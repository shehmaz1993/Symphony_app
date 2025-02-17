import 'package:get/get.dart';

import '../../../data/response/status.dart';
import '../../../model/home/products_model_class.dart';
import '../../../repository/home_repository/home_repository.dart';
class HomeController extends GetxController {

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final productList = ProductModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status status) => rxRequestStatus.value = status;

  void setProductList(ProductModel model) => productList.value = model;

  void setError(String value) => error.value = value;

  void productListFromJson() {
    _api.productListFromJson().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print(value);
      setProductList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {

    setRxRequestStatus(Status.LOADING);
    _api.productListFromJson().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProductList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}
