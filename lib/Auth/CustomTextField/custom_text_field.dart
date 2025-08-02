import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String lable;
  String? Function(String?) validator;
  TextInputType keyboardType;
  TextEditingController controller;
  bool isPassword;
  CustomTextFormField({required this.lable,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        style: TextStyle(
            color: MyTheme.Black, fontSize: 16, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          filled: true,
          fillColor: MyTheme.White, //
          hintText: lable,
          hintStyle: TextStyle(color: MyTheme.Black, fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyTheme.White,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyTheme.White,
              )),
        ),
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
      obscureText: isPassword,
      ),
    );
  }
}
