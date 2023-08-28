import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/home_screen/home.dart';
import 'package:get/get.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/button.dart';
import '../../widgets_common/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

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
            "Register to $appName".text.fontWeight(FontWeight.bold).white.size(19).make(),
            20.heightBox,

            Obx(()=> Column(
                children: [
                  customTextField(
                    title: name,
                    hint: nameHint,
                    controller: nameController,
                    obscure: false,
                  ),
                  5.heightBox,
                  customTextField(
                    title: email,
                    hint: emailHint,
                    controller: emailController,
                    obscure: false,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: (){},
                        child: registerPhNum.text.size(10).make()),
                  ),
                  customTextField(
                    title: password,
                    hint: passwordHint,
                    controller: passwordController,
                    obscure: true,
                  ),
                  10.heightBox,
                  customTextField(
                    title: retypePassword,
                    hint: passwordHint,
                    controller: passwordRetypeController,
                    obscure: true,
                  ),
                  5.heightBox,

                  Row(
                    children: [
                      Checkbox(
                        value: isCheck,
                        onChanged: (newValue){
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                        checkColor: whiteColor,
                        activeColor: redColor,
                      ),

                      Expanded(
                        child: RichText(text: const TextSpan(
                          children: [
                            TextSpan(text: "I agree to the ", style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                            TextSpan(text: termAndCond, style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            )),
                            TextSpan(text: " & ", style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                            TextSpan(text: privacyPolicy, style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            )),
                          ],
                        )),
                      ),
                    ],
                  ),

                  5.heightBox,

                  controller.isLoading.value? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ): ourButton(
                    onPress: () async {
                      if(isCheck!=false){
                        controller.isLoading(true);
                        try{
                          await controller.signupMethod(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text
                          ).then((value){
                            return controller.storeUserData(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text
                            );
                          }).then((value){
                            VxToast.show(context, msg: loggedIn);
                            Get.offAll(()=>const Home());
                          });
                        }
                        catch(e){
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                          controller.isLoading(false);
                        }
                      }
                    },
                    color: isCheck==true? redColor:lightGrey,
                    textColor: isCheck==true? whiteColor:whiteColor,
                    title: "Login",
                  ).box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: "$alreadyHaveAcc  ", style: TextStyle(
                          color: fontGrey,
                        )),
                        TextSpan(
                          text: login,
                          style: TextStyle(
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),

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
