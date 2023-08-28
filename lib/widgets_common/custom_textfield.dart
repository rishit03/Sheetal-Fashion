import 'dart:ffi';

import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint, controller, required bool obscure}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontWeight(FontWeight.w500).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semiBold,
            color: textFieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            ),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}