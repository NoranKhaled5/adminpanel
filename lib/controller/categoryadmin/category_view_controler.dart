import 'package:adminpanel/core/constant/routes.dart';
import 'package:adminpanel/data/remote/categories.dart';
import 'package:get/get.dart';

import '../../View/screen/category/edit.dart';
import '../../View/screen/category/edit.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../data/datasource/model/categoriesmodel.dart';
import '../../data/remote/test_data.dart';

class CategoryViewController extends GetxController {

  CategoriesData categoryData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest){

      // Start backend
      if (response['status'] == "success") {

       List datalist = response['data'];
 data.addAll( datalist.map((e) =>CategoriesModel.fromJson(e)));

      }else{

        statusRequest = StatusRequest.failure ;

      }
      // End
    }
    update();
  }
  deletecategory(String id , String imagename){
    categoryData.delete(
      {"id" : id, "imagename" : imagename});
      data.removeWhere((element) => element.catId == id);
      update();

  }
  goToPageEdit(CategoriesModel categoriesModel){
     Get.toNamed(AppRoute.Categoriesedit , arguments: {
     "categoriesModel" : categoriesModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  myback(){
    //Get.offAllNamed(AppRoute.Homescreen);
    return Future.value(false);
  }
}
