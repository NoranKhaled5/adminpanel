import 'dart:io';
import 'package:adminpanel/controller/Useradmin/user_view_controler.dart';
import 'package:adminpanel/data/remote/categories.dart';
import 'package:adminpanel/data/remote/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../core/function/uplodefile.dart';


class UserAddController extends GetxController {

  UserData userData = UserData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email ;
  late TextEditingController password ;

   StatusRequest? statusRequest = StatusRequest.none;
  File? file ;
  chooseImage()async{
   file = await fileUploaGallery(true);
   update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if(file == null) Get.snackbar("Warning","please Choose Image SVG");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "email" :email.text,
        "password":password.text ,
      };
      var response = await userData.add(data , file!);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest){

        // Start backend
        if (response['status'] == "success") {
         Get.offNamed(AppRoute.UserView);
          //Get.find(AppRoute.CategoryView);
          UserViewController c = Get.find();
          c.getData();
        }else{
          statusRequest = StatusRequest.failure ;

        }
        // End
      }
      update();
    }

  }

  @override
  void onInit() {
    email= TextEditingController();
    password= TextEditingController();
    super.onInit();
  }
}
