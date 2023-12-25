import 'package:adminpanel/View/screen/Useradmin/user_add.dart';
import 'package:adminpanel/core/class/handlingdataview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../controller/Useradmin/user_view_controler.dart';
import '../../../controller/categoryadmin/category_view_controler.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
      //ADD ICON
      floatingActionButton:FloatingActionButton(
        onPressed: (){

          //Get.toName(AppRoute.Useradd)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Useradd()),
          );

        },
        child:const Icon(Icons.add),

      ) ,
      body: GetBuilder<UserViewController>(
        builder:(controller)=> HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: (){
          return controller.myback();
              },
              child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: controller.data.length,
              itemBuilder: (context , index){
              return InkWell(
                onTap: (){
                  controller.goToPageEdit(controller.data[index]);
                },
                child: Card(
                  child: Row(
                    children: [                          //baseUrl = AppLink
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.network(
                              height:80,
                        "${AppLink.imagestCategories}/${controller.data[index].UserImage}"
                      ),
                          )),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            trailing:Row(
                              //mainAxisAlignment: MainAxisAlignment.min,
                              children: [
                                IconButton(
                                  icon:const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "Warninng",
                                        middleText: "Do you want to Delete this file? ",
                                    onCancel: (){},
                                      onConfirm:(){
                                         controller.deleteUser(
                                            controller.data[index].UserId!,
                                            controller.data[index].UserImage!);
                                         Get.back();
                                      }
                                        );

                                  },
                                ),

                                // IconButton(
                                //   icon:Icon(Icons.edit),
                                //   onPressed: () {
                                //     controller.goToPageEdit(
                                //         controller.data[index]);
                                //   },
                                // ),
                              ],
                            ) ,
                             subtitle: Text(
                                 controller.data[index].UserDatetime!
                             ),
                            title: Text(controller.data[index].UserEmail!),)),

                    ],
                  )
                //  Text(controller.data[index].categoriesName!)
                  ),
              );
              }),
              ),
            )
        ) ,

      )
    );
  }
}
