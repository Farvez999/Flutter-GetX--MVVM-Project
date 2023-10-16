import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_project/utils/utils.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget({super.key});

  @override
  State<InputEmailWidget> createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {

  final loginVM= Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField( // Use TextFormField instead of TextField
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          // Utils.snackBar('Email', 'Enter Email'); // Return an error message if validation fails
          return 'Enter Email';
        }
        return null; // Return null if validation passes
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        hintText: 'email_hint'.tr,
        border: OutlineInputBorder(),
      ),
    );
  }
}
