import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredProductsButton({String? title, String? price, icon, double? imgHeight, double? imgWidth}){
  return Column(
        children: [
          SizedBox(
            height: 135,
            child: Image.asset(icon, width: imgWidth, height: imgHeight, alignment: Alignment.center),
          ),
          10.heightBox,
          title!.text.bold.color(darkFontGrey).make(),
          10.heightBox,
          price!.text.semiBold.color(redColor).size(16).make(),
        ],
      ).box.width(140).height(210).white
      .margin(const EdgeInsets.symmetric(horizontal: 7))
      .rounded.padding(const EdgeInsets.all(8)).make();
}