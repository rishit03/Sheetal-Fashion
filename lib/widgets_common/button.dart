import 'package:flutter/material.dart';
import 'package:ecommerce_app/consts/consts.dart';

Widget ourButton({onPress, color, textColor, title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
      onPressed: onPress,
      child: "$title".text.color(textColor).fontFamily(bold).make(),
  );
}