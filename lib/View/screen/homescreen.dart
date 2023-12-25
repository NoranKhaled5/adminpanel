import 'package:adminpanel/View/screen/Useradmin/user_view.dart';
import 'package:adminpanel/controller/home_controller.dart';
import 'package:adminpanel/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Admin"),
      ),
      body: ListView(
          children: [
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 150),
             shrinkWrap: true,
              children: [
                InkWell(
                  child: Card(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                      Image.asset(AppImageAsset.deliveryImage,width: 80,),
                      const Text("Category"),

                    ],),
                  ),onTap: (){
                    Get.toNamed(AppRoute.CategoryView);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const CategoryView()),
                  // );
                },
                ),
                InkWell(
                  child: Card(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImageAsset.deliveryImage2,width: 80,),
                        const Text("Product"),

                      ],),
                  ),onTap: (){
                  Get.toNamed(AppRoute.ProductView);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const ProductView()),
                  // );
                },
                ),
                InkWell(
                  child: Card(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImageAsset.avatar,width: 80,),
                        const Text("User"),

                      ],),
                  ),onTap: (){
                  Get.toNamed(AppRoute.UserView);

                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => const UserView()),
                // );
                },
                ),
              ],
            )
          ],
        ),
      // GetBuilder<HomeControllerImp>(
      // builder: ( controller)=>Container(
      //   padding: EdgeInsets.symmetric(horizontal: 15),
      //   child: ListView(
      //     children: [
      //
      //     ],
      //   ),
      // ) ,

    );
  }
}
