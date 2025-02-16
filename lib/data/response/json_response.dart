import 'package:symphony_app/data/response/status.dart';

class LocalJsonResponse<T>{
  Status? status;
  T? data;
  String? message;
  LocalJsonResponse(this.status,this.data,this.message);

  LocalJsonResponse.loading(): status=Status.LOADING;
  LocalJsonResponse.completed():status=Status.COMPLETED;
  LocalJsonResponse.error():status=Status.ERROR;

  @override
  String toString(){
    return 'Status:$status\n Message:$message\n Data:$data';
  }

}