import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:ecommerce_app/views/user_screen/components/details_card.dart';
import 'package:ecommerce_app/views/user_screen/edit_user_screen.dart';
import 'package:ecommerce_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

import '../../services/firestore_services.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserController());
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else{

              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [

                    //edit profile button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit, color: whiteColor)).onTap(() {

                            controller.nameController.text = data['name'];

                        Get.to(()=> EditUserScreen(data: data));
                      }),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [


                          data['imageUrl'] == ''?

                          Image.asset(icProfilePic, width: 70, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                          :Image.network(data['imageUrl'], width: 70, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}".text.semiBold.white.make(),
                              "${data['email']}".text.white.make()
                            ],
                          )),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: whiteColor),
                              ),
                              onPressed: () async {
                                await Get.put(AuthController()).signoutMethod(context);
                                VxToast.show(context, msg: "Logged out");
                                Get.offAll(()=>const LoginScreen());
                              },
                              child: logout.text.semiBold.white.make()
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(count: data['cart_count'], title: "In your cart", width: context.screenWidth/3.4),
                        detailsCard(count: data['wishlist_count'], title: "In your wishlist", width: context.screenWidth/3.4),
                        detailsCard(count: data['order_count'], title: "Your orders", width: context.screenWidth/3.4),
                      ],
                    ),

                    //buttons section
                    10.heightBox,
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                            leading: Image.asset(profileIconList[index], width: 22),
                            title: profileButtonList[index].text.semiBold.color(darkFontGrey).make(),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: lightGrey,
                          );
                        },
                        itemCount: profileButtonList.length
                    ).box.white.margin(const EdgeInsets.all(12)).rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),

                  ],
                ),
              );

            }


            }
        ),
      ),
    );
  }
}