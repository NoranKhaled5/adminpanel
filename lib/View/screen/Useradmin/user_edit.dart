import 'package:adminpanel/controller/Useradmin/user_edit_controler.dart';
import 'package:adminpanel/core/class/handlingdataview.dart';
import 'package:adminpanel/core/constant/color.dart';
import 'package:adminpanel/core/function/uplodefile.dart';
import 'package:adminpanel/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../controller/categoryadmin/category_edit_controler.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/CustomTextFromGlobal.dart';

class Useredit extends StatelessWidget {
  const Useredit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserEditController controller = Get.put(UserEditController());
    return Scaffold(
        appBar: AppBar(
            title: const Text("Edit Usesr")
        ),
        body: GetBuilder<UserEditController>(
            builder:(controller)=>HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      CustomTextFromGlobal(
                        hintext:"add The Email",
                        labeltext:" Email",
                        icondata:Icons.email,
                        mycontroller:controller.email,
                        valid:(val){
                          return validInput(val!,1,30,"");
                        },
                        isnumber:false,
                      ),
                      CustomTextFromGlobal(
                        hintext:"add The passowrd",
                        labeltext:"password",
                        icondata:Icons.password,
                        mycontroller:controller.password,
                        valid:(val){
                          return validInput(val!,1,30,"");
                        },
                        isnumber:false,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          color: AppColor.thirdColor,
                          textColor: AppColor.secondColor,
                          onPressed: (){
                            controller.chooseImage();
                          },
                          child: const Text("Choose Profile Image"),
                        ),
                      ),
                      if(controller.file !=null)
                        SvgPicture.file(controller.file!),
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
