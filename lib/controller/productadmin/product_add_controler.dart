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
import '../../data/remote/categories.dart';
import '../../data/remote/product_data.dart';
import 'package:drop_down_list/drop_down_list.dart';

class ProductAddController extends GetxController {
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


  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  showOptionImage() {
    showbottommenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploaGallery(false);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {

      if (file == null) Get.snackbar("Warning", "please Choose Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
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
      var response = await productData.add(data, file!);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
           Get.offNamed(AppRoute.ProductView);
          ProductViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
      update();
    }
  }

  getCategories() async {
    CategoriesData categoryData = CategoriesData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryData.get();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for(int i = 0 ; i<data.length; i++){
   dropdownlist.add(
       SelectedListItem(
           name:data[i].name! , value:data[i].catId));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    dropdownname= TextEditingController();
    dropdownid= TextEditingController();
    catid= TextEditingController();
    catname= TextEditingController();

    name= TextEditingController();
    namear= TextEditingController();
    description= TextEditingController();
    descriptionar= TextEditingController();
    discount= TextEditingController();
    count= TextEditingController();
    price= TextEditingController();

    super.onInit();
  }
  showDropDown(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"),
        SelectedListItem(name: "b")
        ],
        selectedItems: (List<dynamic> selectedList) {
        SelectedListItem selectedListItem = selectedList[0];
        dropdownname.text = selectedListItem.name;
        //  showSnackBar(list.toString());
        },
       // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }
}
