 import 'dart:io';
import 'package:adminpanel/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


//open androidmanifest & and add <uses-permission android:name="android.permission.CAMERA"/>

 Future<File?> imageUploadCamera() async {
final XFile? file = await ImagePicker().pickImage(
    source:ImageSource.camera,imageQuality:90);
if (file != null) {
  return File(file.path);
}
else
{
  return null;
}
}
fileUploaGallery([isSvg = false]) async {
FilePickerResult? result = await FilePicker.platform.pickFiles(
  type: FileType.custom,
  allowedExtensions: isSvg
      ? ["svg", "SVG"]
      : [ "png", "PNG", "jpg", "jpeg", "gif"]);

  if (result != null) {
   return File(result.files.single.path!);
    }
  else
  {
    return null;
  }
}
showbottommenu(imageUploadCamera(),fileUploaGallery()){
  Get.bottomSheet(
    Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text("Choose the picture",
                style:TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold)
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              ListTile(
                onTap: (){
                  imageUploadCamera();
                  Get.back();
                },
                leading: const Icon(Icons.camera_alt,
                size: 40,
                ),
                title: const Text("Take a picture",
                style:TextStyle(fontSize: 20) ,
                ),
              ),
              ListTile(
                onTap: (){
                  fileUploaGallery();
                  Get.back();
                },
                leading: const Icon(Icons.image,
                  size: 40,
                ),
                title: const Text("choose from the gallery",
                  style:TextStyle(fontSize: 20)),
              ),
            ],
          ) ,
        )),
    backgroundColor: Colors.white
  );
}