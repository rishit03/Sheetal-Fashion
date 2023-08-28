import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/views/category_screen/category_details.dart';
import 'package:ecommerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: categories.text.semiBold.white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200),
              itemBuilder: (context, index){
            return Column(
              children: [
                10.heightBox,
                SizedBox(
                  height: 120,
                  width: 80,
                  child: Image.asset(categoryImages[index]),
                ),
                20.heightBox,
                categoryLists[index].text.color(darkFontGrey).semiBold.align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
              Get.to(()=>CategoryDetails(title: categoryLists[index]));
            });
          }),
        ),
      ),
    );
  }
}