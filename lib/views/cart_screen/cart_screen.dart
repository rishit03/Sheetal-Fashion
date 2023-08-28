import 'package:ecommerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is Empty!".text.color(darkFontGrey).size(16).makeCentered(),
    );
  }
}