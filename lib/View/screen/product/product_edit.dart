import 'package:adminpanel/core/class/handlingdataview.dart';
import 'package:adminpanel/core/constant/color.dart';
import 'package:adminpanel/core/shared/custombutton.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/productadmin/product_edit_controler.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/CustomTextFromGlobal.dart';
import '../../../core/shared/customdropdownsearch.dart';

class Productedit extends StatelessWidget {
  const Productedit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProducteditController controller = Get.put(ProducteditController());
    return Scaffold(
        appBar: AppBar(
            title: const Text("Edit Product")
        ),
        body: GetBuilder<ProducteditController>(
            builder:(controller)=>HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      CustomTextFromGlobal(
                        hintext:"Edit The Product Name",
                        labeltext:"Product name",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.name,
                        valid:(val){
                          return validInput(val!,1,50,"");
                        },
                        isnumber:false,
                      ),
                      CustomTextFromGlobal(
                        hintext:"Edit The Product(Arabic)",
                        labeltext:"Product name(Arabic)",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.namear,
                        valid:(val){
                          return validInput(val!,1,50,"");
                        },
                        isnumber:false,
                      ),
                      CustomTextFromGlobal(
                        hintext:"Edit The Product description",
                        labeltext:"Product description",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.description,
                        valid:(val){
                          return validInput(val!,1,200,"");
                        },
                        isnumber:false,
                      ),
                      CustomTextFromGlobal(
                        hintext:"Edit The description(Arabic)",
                        labeltext:"Product description(Arabic)",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.descriptionar,
                        valid:(val){
                          return validInput(val!,1,200,"");
                        },
                        isnumber:false,
                      ),
                      CustomTextFromGlobal(
                        hintext:"Edit The count",
                        labeltext:"Product count",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.count,
                        valid:(val){
                          return validInput(val!,1,30,"");
                        },
                        isnumber:true,
                      ),
                      CustomTextFromGlobal(
                        hintext:"Edit The price",
                        labeltext:"Product price",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.price,
                        valid:(val){
                          return validInput(val!,1,30,"");
                        },
                        isnumber:true,
                      ),
                      CustomTextFromGlobal(
                        hintext:"Edit The Discount",
                        labeltext:"Product Discount",
                        icondata:Icons.production_quantity_limits,
                        mycontroller:controller.discount,
                        valid:(val){
                          return validInput(val!,1,30,"");
                        },
                        isnumber:true,
                      ),

                      Customdropdownsearch(
                        title: "Choose the Category",
                        listdata: controller.dropdownlist,
                        dropdownSelectedName:controller.catname!,
                        dropdownSelectedID: controller.catid!,
                      ),
                      const SizedBox(height: 10),
                      RadioListTile(
                          title: const Text("Hide"),
                          value: "0",
                          groupValue: controller.active,
                          onChanged: (val){
                            controller.changeStatusActive(val);

                          }),
                      RadioListTile(
                        title: const Text("Active"),
                          value: "1",
                          groupValue: controller.active,
                          onChanged: (val){
                          controller.changeStatusActive(val);
                          }
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          color: AppColor.thirdColor,
                          textColor: AppColor.secondColor,
                          onPressed: (){
                           // controller.showOptionImage();
                          },
                          child: const Text("Choose Product Image"),
                        ),
                      ),

                      if(controller.file !=null)
                        Image.file(controller.file!, width: 100,height: 100),
                      CustomButton(
                        text: "Save",
                        onPressed: (){
                         controller.editData();
                        },
                      )
                    ],
                  ),
                ),
              ),)
        )
    );
  }
}
