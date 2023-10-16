import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_mvc_project/models/login/user_model.dart';
import 'package:flutter_getx_mvc_project/repository/login_repository/login_repository.dart';
import 'package:flutter_getx_mvc_project/res/routes/routes_name.dart';
import 'package:flutter_getx_mvc_project/utils/utils.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();


  final emailController = TextEditingController(text: "eve.holt@reqres.in").obs;
  final passwordController = TextEditingController(text: "cityslicka").obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi(){
    loading.value = true;
    Map data = {
      'email' : emailController.value.text,
      'password' : passwordController.value.text
    };

    print('$data');

    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'User not found') {
        Utils.snackBar('Login', value['error']);
      }
      else {
        UserModel userModel = UserModel(
            token: value['token'],
            isLogin: true
        );

        userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RouteName.homeView)!.then((value) {});
          Utils.snackBar('Login', 'Login Successfully');
        }).onError((error, stackTrace) {
          print(error.toString());
        });
      }
    }).onError((error, stackTrace){
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}