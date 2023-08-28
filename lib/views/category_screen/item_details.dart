import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/widgets_common/button.dart';
import 'package:flutter/material.dart';

import '../home_screen/components/featuredProducts_button.dart';

class ItemDetails extends StatefulWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: widget.title!.text.color(darkFontGrey).semiBold.make(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //swiper section
                  VxSwiper.builder(
                    autoPlay: false,
                      height: 350,
                      aspectRatio: 16/9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                    return Image.asset(icWatch, fit: BoxFit.cover);
                  }),
                  10.heightBox,
                  //title and details section
                  widget.title!.text.size(16).color(darkFontGrey).semiBold.make(),
                  10.heightBox,
                  //rating
                  VxRating(
                    onRatingUpdate: (value){},
                    normalColor: textFieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "\$12,499".text.color(redColor).bold.size(18).make(),

                  10.heightBox,

                  Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Seller".text.white.semiBold.make(),
                          5.heightBox,
                          "In House Brands".text.semiBold.color(darkFontGrey).size(16).make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(Icons.message_rounded, color: darkFontGrey),
                      ),
                    ],
                  ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textFieldGrey).make(),
                  20.heightBox,

                  //color section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textFieldGrey).make(),
                          ),
                          Row(
                            children: [
                              VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).
                              margin(const EdgeInsets.symmetric(horizontal: 4)).make(),
                              VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).
                              margin(const EdgeInsets.symmetric(horizontal: 4)).make(),
                              VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).
                              margin(const EdgeInsets.symmetric(horizontal: 4)).make(),
                            ],
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                      //quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity: ".text.color(textFieldGrey).make(),
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                              "0".text.size(16).color(darkFontGrey).semiBold.make(),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                              10.widthBox,
                              "(0 available)".text.color(textFieldGrey).make(),
                            ],
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                      //total price row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(textFieldGrey).make(),
                          ),
                          "\$0.00".text.color(redColor).size(16).semiBold.make()
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),

                    ],
                  ).box.white.shadowSm.make(),

                  20.heightBox,
                  //description section
                  "Description".text.color(darkFontGrey).semiBold.make(),
                  10.heightBox,
                  "This is a dummy item and dummy description here.. ".text.color(darkFontGrey).make(),
                  10.heightBox,
                  //buttons section
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        title: video.text.semiBold.color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                      ListTile(
                        title: review.text.semiBold.color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                      ListTile(
                        title: privacyPolicy.text.semiBold.color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                      ListTile(
                        title: returnPolicy.text.semiBold.color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                      ),
                      ListTile(
                        title: supportPolicy.text.semiBold.color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                      ),

                      15.heightBox,

                      //products you may like section
                      productsYouMayLike.text.color(darkFontGrey).size(16).semiBold.make(),
                      10.heightBox,

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            featuredProductsButton(title: iphone12, price: "\$799", icon: icSmartphone, imgWidth: 75, imgHeight: 150),
                            featuredProductsButton(title: rolexWatch, price: "\$12,999", icon: icWatch, imgWidth: 98, imgHeight: 150),
                            featuredProductsButton(title: macBook, price: "\$1,499", icon: icMacbook, imgWidth: 128, imgHeight: 75),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: (){},
              textColor: whiteColor,
              title: "Add to cart",
            ),
          ),
        ],
      ),
    );
  }
}
