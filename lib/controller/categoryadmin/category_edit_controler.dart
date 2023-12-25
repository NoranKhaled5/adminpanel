import 'dart:io';
import 'package:adminpanel/data/remote/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../core/function/uplodefile.dart';
import '../../data/datasource/model/categoriesmodel.dart';
import 'category_view_controler.dart';

class CategoryeditController extends GetxController {

  CategoriesData categoryData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name ;
  late TextEditingController description ;
  CategoriesModel? categoriesModel;

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
        "name" :name.text,
        "description":description.text ,
        "imageold" : categoriesModel!.categoriesImage!,
        "id" : categoriesModel!.catId.toString()
      };
      var response = await categoryData.edit(data , file);

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
    //}

  }

  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'];
    name= TextEditingController();
    description= TextEditingController();
    name.text = categoriesModel!.name!;
    description.text = categoriesModel!.description!;

    super.onInit();
  }
}
