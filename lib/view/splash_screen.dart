import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_project/res/assets/image_assets.dart';
import 'package:flutter_getx_mvc_project/res/components/general_exception_widget.dart';
import 'package:flutter_getx_mvc_project/res/components/internet_exception_widget.dart';
import 'package:flutter_getx_mvc_project/res/components/round_button.dart';
import 'package:flutter_getx_mvc_project/utils/utils.dart';
import 'package:flutter_getx_mvc_project/view_models/services/splash_service.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplahServices splashScreen = SplahServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.teal,
      body: Center(child: Text('welcome_back'.tr, textAlign: TextAlign.center,)),
      //   appBar: AppBar(
      //     title: Center(child: Text('email_hint'.tr)),
      //   ),
      // body: Column(
      //   children: [
      //     RoundButton(onPress: (){}, title: "Login", width: double.infinity, loading: true,),
      //     RoundButton(onPress: (){}, title: "Sign up",width: 200,)
      //   ],
      // ),
      // body: GeneralExceptionWidget(onPress: () {  },),
      // body: Image(image: AssetImage(ImageAssets.splashScreen)),
    );
  }
}
