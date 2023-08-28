import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget appLogoWidget() {
  // using velocity_x
  return Image.asset(icAppLogo)
      .box.white.size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded.make();
}