import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}){
 return Container(
     decoration: const BoxDecoration(
         image: DecorationImage(
             image: AssetImage(bgImage),
             alignment: Alignment.topCenter,
         ),
         color: offWhite,
     ),
     child: child,
    );
}