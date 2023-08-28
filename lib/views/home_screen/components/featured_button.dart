import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget featuredButton({String? title, icon, double? imgHeight, double? imgWidth}){
  return Row(
    children: [
      Container(
        height: 45,
        width: 40,
        child: Image.asset(icon, width: imgWidth, height: imgHeight, alignment: Alignment.center),
      ),
      10.widthBox,
      title!.text.fontFamily(semiBold).color(darkFontGrey).make(),
    ],
  ).box.width(170).margin(const EdgeInsets.symmetric(horizontal: 4)).white.padding(const EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
}