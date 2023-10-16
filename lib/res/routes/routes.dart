import 'package:flutter_getx_mvc_project/res/routes/routes_name.dart';
import 'package:flutter_getx_mvc_project/view/home/home_view.dart';
import 'package:flutter_getx_mvc_project/view/login/login_view.dart';
import 'package:flutter_getx_mvc_project/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes()=>[
    GetPage(
        name: RouteName.splashScreen,
        page: ()=> SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    GetPage(
        name: RouteName.loginView,
        page: ()=> LoginView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),


    GetPage(
        name: RouteName.homeView,
        page: ()=> HomeView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}