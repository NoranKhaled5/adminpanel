import 'dart:io';
import 'package:adminpanel/controller/productadmin/product_view_controler.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handingdatacontroller.dart';
import '../../core/function/uplodefile.dart';
import '../../data/datasource/model/categoriesmodel.dart';
import '../../data/datasource/model/itemsmodel.dart';
import '../../data/remote/product_data.dart';

class ProducteditController extends GetxController {

  ProductData productData = ProductData(Get.find());
  List<SelectedListItem> dropdownlist =[];

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController dropdownname;

  late TextEditingController dropdownid;

  late TextEditingController name;

  late TextEditingController namear;

  late TextEditingController description;

  late TextEditingController descriptionar;

  late TextEditingController count;

  late TextEditingController price;

  late TextEditingController discount;

  TextEditingController? catid;
  TextEditingController? catname;


  ItemsModel? itemsModel;

  StatusRequest? statusRequest = StatusRequest.none;
  File? file ;
  String? active ;
  changeStatusActive(val){
    active =val;
    update();
  }

  chooseImage()async{
    file = await fileUploaGallery(true);
    update();
  }

  editData() async {
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "id":            itemsModel!.itemsId,
      "imageold":      itemsModel!.itemsImage,
      "active":        active,
      "name":          name.text,
      "namear":        namear.text,
      "description":   description.text,
      "descriptionar": descriptionar.text,
      "count":         count.text,
      "price":         price.text,
      "discount":      discount.text,
      "catid":         catid!.text,
      "catname":       catname!.text,
      "datanow":       DateTime.now().toString(),

    };
    var response = await productData.edit(data , file);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest){

      // Start backend
      if (response['status'] == "success") {
         Get.offNamed(AppRoute.CategoryView);
        //Get.find(AppRoute.CategoryView);
        ProductViewController c = Get.find();
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
    itemsModel = Get.arguments['itemsModel'];

    name= TextEditingController();
    namear= TextEditingController();
    dropdownname= TextEditingController();
    dropdownid= TextEditingController();
    catid= TextEditingController();
    catname= TextEditingController();
    description= TextEditingController();
    descriptionar= TextEditingController();
    discount= TextEditingController();
    count= TextEditingController();
    price= TextEditingController();

     name.text = itemsModel!.itemsName!;
     namear.text = itemsModel!.itemsNameAr!;

    // dropdownname.text = itemsModel!.itemsName!;
    // dropdownid.text = itemsModel!.itemsName!;

    catid!.text = itemsModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;
    active = itemsModel!.itemsActive!;

    description.text = itemsModel!.itemsDesc!;
    descriptionar.text = itemsModel!.itemsDescAr!;

    discount.text = itemsModel!.itemsDiscount!;
    count.text = itemsModel!.itemsCount!;
    price.text = itemsModel!.itemsPrice!;
    super.onInit();
  }
}
