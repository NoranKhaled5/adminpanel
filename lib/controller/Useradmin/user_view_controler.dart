import 'package:adminpanel/data/datasource/model/user.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handingdatacontroller.dart';

import '../../data/remote/user.dart';

class UserViewController extends GetxController {

  UserData userData = UserData(Get.find());

  List<UserModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest){

      // Start backend
      if (response['status'] == "success") {

       List datalist = response['data'];
 data.addAll( datalist.map((e) =>UserModel.fromJson(e)));

      }else{

        statusRequest = StatusRequest.failure ;

      }
      // End
    }
    update();
  }
  deleteUser(String id , String imagename){
    userData.delete(
      {"id" : id, "imagename" : imagename});
      data.removeWhere((element) => element.UserId == id);
      update();

  }
  goToPageEdit(UserModel userModel){
     Get.toNamed(AppRoute.Useredit , arguments: {
       "categoriesModel" : UserModel
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
