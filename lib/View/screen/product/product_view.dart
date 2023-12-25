import 'package:adminpanel/View/screen/product/product_add.dart';
import 'package:adminpanel/core/class/handlingdataview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../applink.dart';
import '../../../controller/productadmin/product_view_controler.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      //ADD ICON
      floatingActionButton:FloatingActionButton(
        onPressed: (){

          //Get.toName(AppRoute.Productadd)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Productadd()),
          );

        },
        child:Icon(Icons.add),

      ) ,
      body: GetBuilder<ProductViewController>(
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
                            child: CachedNetworkImage(
                              height:80,
                              imageUrl:
                        "${AppLink.imagestItems}/${controller.data[index].itemsId}",
                      ),
                          )),
                      Expanded(
                          flex: 3,
                          child: ListTile(
                            trailing:Row(
                              //mainAxisAlignment: MainAxisAlignment.min,
                              children: [
                                IconButton(
                                  icon:Icon(Icons.delete_outline),
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "Warninng",
                                        middleText: "Do you want to Delete this file? ",
                                    onCancel: (){},
                                      onConfirm:(){
                                         controller.deleteproduct(
                                            controller.data[index].itemsId!,
                                            controller.data[index].itemsImage!);
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
                                 controller.data[index].categoriesName!
                             ),
                            title: Text(controller.data[index].itemsName !),)),

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
