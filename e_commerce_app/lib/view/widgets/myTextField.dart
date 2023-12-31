// ignore_for_file: file_names, must_be_immutable

import 'package:e_commerce_app/common/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final hint;
  final bool isPassword;
  final double width;
  final Icon pIcon;
  bool isNum = false;
  MyTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    required this.isNum,
    required this.width,
    required this.pIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: TextField(
        keyboardType: isNum ? TextInputType.number : null,
        style: const TextStyle(color: MyColors.silver),
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
          prefixIcon: pIcon,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          labelStyle: const TextStyle(color: MyColors.silver, fontSize: 20),
          labelText: "$hint",
        ),
        controller: controller,
      ),
    );
  }
}
