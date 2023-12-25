import 'package:adminpanel/core/constant/routes.dart';
import 'package:get/get.dart';

import '../../View/screen/category/edit.dart';
import '../../View/screen/product/product_edit.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../data/datasource/model/categoriesmodel.dart';
import '../../data/datasource/model/itemsmodel.dart';
import '../../data/remote/product_data.dart';
import '../../data/remote/test_data.dart';

class ProductViewController extends GetxController {

  ProductData productData = ProductData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await productData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest){

      // Start backend
      if (response['status'] == "success") {

        List datalist = response['data'];
        data.addAll( datalist.map((e) =>ItemsModel.fromJson(e)));

      }else{

        statusRequest = StatusRequest.failure ;

      }
      // End
    }
    update();
  }
  deleteproduct(String id , String imagename){
    productData.delete(
        {"id" : id, "imagename" : imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();

  }
  goToPageEdit(ItemsModel itemsModel){
     Get.toNamed(AppRoute.Productedit , arguments: {
       "itemsModel" : ItemsModel
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
