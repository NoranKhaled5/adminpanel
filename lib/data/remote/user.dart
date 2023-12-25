
import 'dart:io';
import '../../applink.dart';
import '../../core/class/crud.dart';

class UserData {
  Crud crud;
  UserData(this.crud);
  get() async {
    var response = await crud.postData(
    AppLink.userview, {});
    return response.fold((l) => l, (r) => r);
  }
  add(Map data ,File file) async {
    var response = await crud.addRequestWithImageOne(
    AppLink.useradd, data , file);
    return response.fold((l) => l, (r) => r);
  }
  edit(Map data , [File? file]) async {
    var response;

    if(file == null) {
      response = await crud.postData(

      AppLink.useredit, data);
    }else {
      response = await crud.addRequestWithImageOne(
      AppLink.useredit, data,file);
    }

    return response.fold((l) => l, (r) => r);
  }
  delete(Map data) async {
    var response = await crud.postData(
    AppLink.userdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}

