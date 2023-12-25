import 'dart:io';
import 'package:adminpanel/controller/Useradmin/user_view_controler.dart';
import 'package:adminpanel/data/remote/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../core/function/uplodefile.dart';
import '../../data/datasource/model/user.dart';
import '../../data/remote/user.dart';

class UserEditController extends GetxController {

  UserData userData = UserData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email ;
  late TextEditingController password ;
  UserModel? userModel;

  StatusRequest? statusRequest = StatusRequest.none;
  File? file ;
  chooseImage()async{
    file = await fileUploaGallery(true);
    update();
  }

  editData() async {
    statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "E-mail" :email.text,
        "Password":password.text ,
        "imageold" : userModel!.UserImage,
        "id" : userModel!.UserId.toString()
      };
      var response = await userData.edit(data , file);

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
    //}

  }

  @override
  void onInit() {
    userModel = Get.arguments['userModel'];
    email= TextEditingController();
    password= TextEditingController();
    email.text = userModel!.UserEmail!;
    password.text = userModel!.UserPassword!;
    super.onInit();
  }
}
