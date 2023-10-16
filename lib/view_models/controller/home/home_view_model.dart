

import 'package:flutter_getx_mvc_project/data/response/status.dart';
import 'package:flutter_getx_mvc_project/models/home/user_list_model.dart';
import 'package:flutter_getx_mvc_project/repository/home_repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi(){
    // setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }

  void refreshApi(){
    setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }

}