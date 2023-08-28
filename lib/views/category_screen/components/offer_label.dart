import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget offerLabel({String? discount}){
  return Container(
    alignment: Alignment.topRight,
    child: Column(
      children: [
        discount!.text.white.semiBold.center.make(),
      ],
    ).box.width(50).height(18).bottomLeftRounded().black.clip(Clip.antiAlias).make(),
  );
}