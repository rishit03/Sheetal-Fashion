import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/auth_screen/signup_screen.dart';
import 'package:ecommerce_app/views/home_screen/home.dart';
import 'package:ecommerce_app/widgets_common/applogo_widget.dart';
import 'package:ecommerce_app/widgets_common/bg_widget.dart';
import 'package:ecommerce_app/widgets_common/button.dart';
import 'package:ecommerce_app/widgets_common/custom_textfield.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.11).heightBox,
              appLogoWidget(),
              15.heightBox,
              "Log in to $appName".text.fontWeight(FontWeight.bold).white.size(19).make(),
              20.heightBox,

              Obx(()=> Column(
                  children: [
                    customTextField(
                      title: email,
                      hint: emailHint,
                      obscure: false,
                      controller: controller.emailController,
                    ),
                    10.heightBox,
                    customTextField(
                      title: password,
                      hint: passwordHint,
                      obscure: true,
                      controller: controller.passwordController,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: (){},
                          child: forgotPassword.text.size(10).make()),
                    ),
                    5.heightBox,
                    controller.isLoading.value? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ): ourButton(
                      onPress: () async {
                        controller.isLoading(true);
                        await controller.loginMethod(context: context).then((value){
                          if(value!=null){
                            VxToast.show(context, msg: loggedIn);
                            Get.offAll(() => const Home());
                          }else{
                            controller.isLoading(false);
                          }
                        });
                      },
                      color: redColor,
                      textColor: whiteColor,
                      title: login,
                    ).box.width(context.screenWidth-50).make(),
                    15.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    10.heightBox,
                    ourButton(
                      onPress: (){
                        Get.to(() => const SignupScreen());
                      },
                      color: lightPink,
                      textColor: redColor,
                      title: signup,
                    ).box.width(context.screenWidth-50).make(),
                    15.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(socialIconList[index], width: 35,),
                        ),
                      )),
                    )



                  ],
                ).box.white.rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70).shadowSm.make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
