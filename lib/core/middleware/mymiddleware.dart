import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';
import '../service/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find() ;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("homescreen") == "1"){
      return const RouteSettings(name: AppRoute.homescreen) ;
    }
    return null;
  }
}