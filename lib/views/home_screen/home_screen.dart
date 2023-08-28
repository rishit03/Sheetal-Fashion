import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/views/category_screen/category_details.dart';
import 'package:ecommerce_app/views/home_screen/components/featuredProducts_button.dart';
import 'package:ecommerce_app/views/home_screen/components/featured_button.dart';
import 'package:ecommerce_app/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child: Column(
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: whiteColor,
                hintText: searchAnything,
                hintStyle: TextStyle(color: textFieldGrey),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          10.heightBox,

          //image slider
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VxSwiper.builder(
                    aspectRatio: 16/9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      height: 100,
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index){
                    return Image.asset(slidersList[index], fit: BoxFit.cover)
                        .box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                  }),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      homeButtons(
                        height: context.screenHeight*0.15,
                        width: context.screenWidth/2.5,
                        icon: icTodayDeal,
                        title: todayDeal,
                      ),
                      homeButtons(
                        height: context.screenHeight*0.15,
                        width: context.screenWidth/2.5,
                        icon: icFlashDeal,
                        title: flashSale,
                      ),
                    ],
                  ),
                  15.heightBox,

                  //image slider
                  VxSwiper.builder(
                      aspectRatio: 16/9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      height: 100,
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index){
                        return Image.asset(slidersList[index], fit: BoxFit.cover,)
                            .box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                      }),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      homeButtons(
                        height: context.screenHeight*0.15,
                        width: context.screenWidth/3.5,
                        icon: icTopCategories,
                        title: topCategories,
                      ),
                      homeButtons(
                        height: context.screenHeight*0.15,
                        width: context.screenWidth/3.5,
                        icon: icBrands,
                        title: brand,
                      ),
                      homeButtons(
                        height: context.screenHeight*0.15,
                        width: context.screenWidth/3.5,
                        icon: icTopSellers,
                        title: topSellers,
                      ),
                    ],
                  ),
                  20.heightBox,

                  Align(
                    alignment: Alignment.centerLeft,
                    child: featuredCategories.text.color(darkFontGrey).size(18)
                        .fontFamily(semiBold).make(),
                  ),
                  20.heightBox,

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            featuredButton(title: watch, icon: icWatch, imgWidth: 20, imgHeight: 35).onTap(() {
                              Get.to(()=>const CategoryDetails(title: watch));
                            }),
                            10.heightBox,
                            featuredButton(title: fashion, icon: icFashion, imgWidth: 35, imgHeight: 45).onTap(() {
                              Get.to(()=>const CategoryDetails(title: fashion));
                            }),
                          ],
                        ),
                        Column(
                          children: [
                            featuredButton(title: smartphone, icon: icSmartphone, imgWidth: 25, imgHeight: 45).onTap(() {
                              Get.to(()=>const CategoryDetails(title: smartphone));

                            }),
                            10.heightBox,
                            featuredButton(title: daily, icon: icDaily, imgWidth: 35, imgHeight: 45).onTap(() {
                              Get.to(()=>const CategoryDetails(title: daily));

                            }),
                          ],
                        ),
                        Column(
                          children: [
                            featuredButton(title: electronics, icon: icElectronics, imgWidth: 35, imgHeight: 45).onTap(() {
                              Get.to(()=>const CategoryDetails(title: electronics));

                            }),
                            10.heightBox,
                            featuredButton(title: accessories, icon: icAccessories, imgWidth: 35, imgHeight: 45).onTap(() {
                              Get.to(()=>const CategoryDetails(title: accessories));

                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: redColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [featuredProducts.text.white.fontFamily(bold).size(18).make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              featuredProductsButton(title: iphone12, price: "\$799", icon: icSmartphone, imgWidth: 100, imgHeight: 200),
                              featuredProductsButton(title: rolexWatch, price: "\$12,999", icon: icWatch, imgWidth: 130, imgHeight: 200),
                              featuredProductsButton(title: macBook, price: "\$1,499", icon: icMacbook, imgWidth: 170, imgHeight: 100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,

                  //image slider
                  VxSwiper.builder(
                      aspectRatio: 16/9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      height: 100,
                      enlargeCenterPage: true,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index){
                        return Image.asset(slidersList[index], fit: BoxFit.cover)
                            .box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                      }),
                  20.heightBox,
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 280,
                        ),
                      itemBuilder: (context, index){
                    return Container(
                      color: whiteColor,
                      child: Column(
                        children: [
                          10.heightBox,
                          Image.asset(icSmartphone, height: 200, width: 100),
                          10.heightBox,
                          iphone12.text.bold.color(darkFontGrey).make(),
                          10.heightBox,
                          "\$799".text.semiBold.color(redColor).size(16).make(),

                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),),

    );
  }
}
