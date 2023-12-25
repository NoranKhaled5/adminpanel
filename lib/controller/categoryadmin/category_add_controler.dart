import 'dart:io';
import 'package:adminpanel/data/remote/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../core/function/uplodefile.dart';
import 'category_view_controler.dart';


class CategoryAddController extends GetxController {

  CategoriesData categoryData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name ;
  late TextEditingController namear ;

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
        "name" :name.text,
        "namear":namear.text ,
      };
      var response = await categoryData.add(data , file!);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest){

        // Start backend
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.CategoryView);
          //Get.find(AppRoute.CategoryView);
          CategoryViewController c = Get.find();
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
    name= TextEditingController();
    namear= TextEditingController();
    super.onInit();
  }
}
