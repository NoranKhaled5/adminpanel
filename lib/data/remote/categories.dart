
import 'dart:io';
import '../../applink.dart';
import '../../core/class/crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  get() async {
     var response = await crud.postData(
         AppLink.catview, {});
     return response.fold((l) => l, (r) => r);
  }
  add(Map data ,File file) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.catadd, data , file);
    return response.fold((l) => l, (r) => r);
  }
  edit(Map data , [File? file]) async {
    var response;

    if(file == null) {
       response = await crud.postData(
      AppLink.catedit, data);
    }else {
       response = await crud.addRequestWithImageOne(
      AppLink.catedit, data,file);
    }

    return response.fold((l) => l, (r) => r);
  }
  delete(Map data) async {
    var response = await crud.postData(
    AppLink.catdelete, data);
    return response.fold((l) => l, (r) => r);
  }
  }

