import 'package:flutter/material.dart';
import 'package:flutter_getx_mvc_project/data/response/status.dart';
import 'package:flutter_getx_mvc_project/res/components/general_exception_widget.dart';
import 'package:flutter_getx_mvc_project/res/components/internet_exception_widget.dart';
import 'package:flutter_getx_mvc_project/res/routes/routes_name.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/home/home_view_model.dart';
import 'package:flutter_getx_mvc_project/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {

  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value == 'No Internet Connection'){
              return InternetExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
            }else{
              return GeneralExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
                Text(homeController.error.toString());
            }

          case Status.COMPLETED:

            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                  ),
                  title: Text(homeController.userList.value.data![index].firstName.toString()),
                  subtitle: Text(homeController.userList.value.data![index].email.toString()),
                ),
              );
            });
        }
        return SizedBox();
      }),
    );
  }
}
