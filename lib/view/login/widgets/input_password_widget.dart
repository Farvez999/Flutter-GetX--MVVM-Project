import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget({super.key});

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {

  final loginVM= Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return  TextFormField( // Use TextFormField instead of TextField
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          // Utils.snackBar('Password', 'Enter Password'); // Return an error message if validation fails
          return 'Enter Password';
        }
        return null; // Return null if validation passes
      },
      onFieldSubmitted: (value) {

      },
      decoration: InputDecoration(
        hintText: 'password_hint'.tr,
        border: OutlineInputBorder(),
      ),
    );
  }
}
