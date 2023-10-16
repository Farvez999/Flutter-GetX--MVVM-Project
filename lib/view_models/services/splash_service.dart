import 'dart:async';

import 'package:flutter_getx_mvc_project/res/routes/routes_name.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplahServices {

  UserPreference userPreference = UserPreference();

  void isLogin(){
    userPreference.getUser().then((value) => {
      print(value.token),
      print(value.isLogin),

      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3), () {
        Get.toNamed(RouteName.loginView);
      })
      }else{
        Timer(const Duration(seconds: 3), () {
        Get.toNamed(RouteName.homeView);
      })
      }
    });
  }
}