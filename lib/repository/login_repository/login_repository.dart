import 'dart:ui';

import 'package:flutter_getx_mvc_project/data/network/network_api_services.dart';
import 'package:flutter_getx_mvc_project/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async{
    dynamic response =await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
  // Future<dynamic> loginApi(var data) async {
  //   try {
  //     dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
  //     return response;
  //   } catch (e) {
  //     // Handle the timeout or other exceptions
  //     print('Error: $e');
  //     return null; // or throw an error if necessary
  //   }
  // }

}