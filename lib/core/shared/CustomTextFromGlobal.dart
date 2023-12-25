import 'package:flutter/material.dart';

class CustomTextFromGlobal extends StatelessWidget {
  final String hintext;
  final String labeltext;
  final IconData icondata;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isnumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFromGlobal(
      {Key? key,
        this.obscureText,
        this.onTapIcon,
        required this.hintext,
        required this.labeltext,
        required this.icondata,
        required this.mycontroller,
        required this.valid,
        required this.isnumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false  ? false : true,
        decoration: InputDecoration(
            hintText: hintext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: InkWell(child: Icon(icondata), onTap: onTapIcon),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}