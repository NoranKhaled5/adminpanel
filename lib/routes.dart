
import 'package:adminpanel/View/screen/product/product_edit.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'View/screen/Useradmin/user_add.dart';
import 'View/screen/Useradmin/user_edit.dart';
import 'View/screen/Useradmin/user_view.dart';
import 'View/screen/category/categoriesadd.dart';
import 'View/screen/category/edit.dart';
import 'View/screen/category/view.dart';
import 'View/screen/homescreen.dart';
import 'View/screen/product/product_add.dart';
import 'View/screen/product/product_view.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Homescreen(), middlewares: [MyMiddleWare()]),
//GetPage(name: AppRoute.homescreen, page: () => const Homescreen()),

//category
GetPage(name: AppRoute.CategoryView, page: () => const CategoryView()),
GetPage(name: AppRoute.Categoriesadd, page: () => const Categoriesadd()),
GetPage(name: AppRoute.Categoriesedit, page: () => const Categoriesedit()),
//product
GetPage(name: AppRoute.ProductView, page: () => const ProductView()),
GetPage(name: AppRoute.Productadd, page: () => const Productadd()),
GetPage(name: AppRoute.Productedit, page: () => const Productedit()),

  //user
  GetPage(name: AppRoute.UserView, page: () => const UserView()),
  GetPage(name: AppRoute.Useradd, page: () => const Useradd()),
  GetPage(name: AppRoute.Useredit, page: () => const Useredit()),

];
