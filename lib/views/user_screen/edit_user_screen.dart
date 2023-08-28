import 'dart:io';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controllers/user_controller.dart';
import 'package:ecommerce_app/widgets_common/bg_widget.dart';
import 'package:ecommerce_app/widgets_common/button.dart';
import 'package:ecommerce_app/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class EditUserScreen extends StatelessWidget {

  final dynamic data;


  const EditUserScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UserController>();

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(()=>
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [


            data['imageUrl'] == '' && controller.profileImagePath.isEmpty? Image.asset(
                icProfilePic,
                width: 70, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make() :
            data['imageUrl'] != null && controller.profileImagePath.isEmpty? Image.network(
                  data['imageUrl'],
                  width: 110,
                  fit: BoxFit.cover
                ).box.roundedFull.clip(Clip.antiAlias).make() : Image.file(File(
                controller.profileImagePath.value
            ),
                width: 110,
                fit: BoxFit.cover
            ).box.roundedFull.clip(Clip.antiAlias).make(),


              10.heightBox,
              ourButton(
                color: redColor,
                onPress: (){
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change",
              ),
              const Divider(),
              20.heightBox,
              customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                obscure: false,
              ),
              10.heightBox,
              customTextField(
                controller: controller.oldPassController,
                hint: passwordHint,
                title: oldPassword,
                obscure: true,
              ),
              10.heightBox,
              customTextField(
                controller: controller.newPassController,
                hint: passwordHint,
                title: newPassword,
                obscure: true,
              ),
              20.heightBox,
              controller.isLoading.value? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ): SizedBox(
                width: context.screenWidth-60,
                child: ourButton(
                  color: redColor,
                  onPress: () async{
                    controller.isLoading(true);

                    //if image is not selected
                    if(controller.profileImagePath.value.isNotEmpty){
                      await controller.uploadProfileImage();
                    } else{
                      controller.profileImageLink = data['imageUrl'];
                    }

                    //if old password matches the database
                    if(data['password'] == controller.oldPassController.text){

                      await controller.changeAuthPassword(
                        email: data['email'],
                        password: controller.oldPassController.text,
                        newPassword: controller.newPassController.text,
                      );
                      await controller.updateProfile(
                        imgUrl: controller.profileImageLink,
                        name: controller.nameController.text,
                        password: controller.newPassController.text,
                      );
                      Get.back();
                      VxToast.show(context, msg: "Updated");
                    }else{
                      VxToast.show(context, msg: "Wrong old password!");
                      controller.isLoading(false);
                    }


                  },
                  textColor: whiteColor,
                  title: "Save",
                ),
              ),
            ],
          ).box.white.shadowSm.
          padding(const EdgeInsets.all(16)).
          margin(const EdgeInsets.only(
              top: 50,
              left: 12,
              right: 12)).
          rounded.make(),
        ),
      ),
    );
  }
}
