import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_project/res/components/round_button.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  const LoginButtonWidget({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {

    final loginVM= Get.put(LoginViewModel());

    return Obx(() => RoundButton(
      width: 200,
      title: 'login'.tr,
      loading: loginVM.loading.value,
      onPress: () {
        if (formKey.currentState!.validate()) {
          loginVM.loginApi();
          // The form is valid, perform the desired action
        }
      },
    ));
  }
}

