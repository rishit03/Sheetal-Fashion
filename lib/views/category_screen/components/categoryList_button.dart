import 'package:ecommerce_app/consts/consts.dart';
import 'offer_label.dart';

Widget categoryListButton({image, String? title, String? price, String? offer}){
  return Column(
    children: [
      offerLabel(discount: offer),
      10.heightBox,
      SizedBox(
        height: 100,
        width: 80,
        child: Image.asset(image),
      ),
      10.heightBox,
      SizedBox(
        height: 30,
        width: 130,
        child: title!.text.color(fontGrey).make(),
      ),
      10.heightBox,
      SizedBox(
        height: 20,
        width: 130,
        child: price!.text.color(redColor).size(20).align(TextAlign.left).bold.make(),
      ),


    ],
  ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make();
}