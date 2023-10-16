import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_project/res/components/round_button.dart';
import 'package:flutter_getx_mvc_project/utils/utils.dart';
import 'package:flutter_getx_mvc_project/view/login/widgets/input_email_widget.dart';
import 'package:flutter_getx_mvc_project/view/login/widgets/input_password_widget.dart';
import 'package:flutter_getx_mvc_project/view/login/widgets/login_button_widget.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM= Get.put(LoginViewModel());

  final _formKey = GlobalKey<FormState>();

 /* @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<LoginViewModel>();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const InputEmailWidget(),
                  const SizedBox(height: 20),
                  const InputPasswordWidget(),
                  const SizedBox(height: 40),
                  LoginButtonWidget(formKey: _formKey,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
