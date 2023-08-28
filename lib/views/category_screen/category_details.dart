import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/views/category_screen/components/categoryList_button.dart';
import 'package:ecommerce_app/views/category_screen/item_details.dart';
import 'package:ecommerce_app/widgets_common/bg_widget.dart';
import 'package:ecommerce_app/widgets_common/loading_indicator.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.semiBold.white.make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: loadingIndicator(),
                );
              } else if(snapshot.data!.docs.isEmpty){
                return Center(
                  child: "No products found".text.color(darkFontGrey).make(),
                );
              } else{

                var data = snapshot.data!.docs;

                return Container(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (context, index) {
                        return categoryListButton(
                          image: icWatch,
                          title: "${data[index]['p_name']}",
                          price: "\$${data[index]['p_price']}",
                          offer: "-20%",
                        ).onTap(() {
                          Get.to(()=>const ItemDetails(title: "Dummy Title"));
                        });
                      }),

                );
              }
            },
        ),
      ),
    );
  }
}
