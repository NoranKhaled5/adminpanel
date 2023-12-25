import 'package:adminpanel/core/class/handlingdataview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../applink.dart';
import '../../../controller/categoryadmin/category_view_controler.dart';
import 'categoriesadd.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      //ADD ICON
      floatingActionButton:FloatingActionButton(
        onPressed: (){

          //Get.toName(AppRoute.Categoriesadd)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Categoriesadd()),
          );

        },
        child:Icon(Icons.add),

      ) ,
      body: GetBuilder<CategoryViewController>(
        builder:(controller)=> HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: (){
          return controller.myback();
              },
              child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                            padding: EdgeInsets.all(4),
                            child: SvgPicture.network(
                              height:80,
                        "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}"
                      ),
                          )),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            trailing:Row(
                            //  mainAxisAlignment: MainAxisAlignment.min,
                              children: [
                                IconButton(
                                  icon:Icon(Icons.delete_outline),
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "Warninng",
                                        middleText: "Do you want to Delete this file? ",
                                    onCancel: (){},
                                      onConfirm:(){
                                         controller.deletecategory(
                                            controller.data[index].catId!,
                                            controller.data[index].categoriesImage!);
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
                             // subtitle: Text(
                             //     controller.data[index].categoriesDatetime!
                             // ),
                            title: Text(controller.data[index].name!),)),

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
