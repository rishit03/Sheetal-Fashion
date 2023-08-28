import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:ecommerce_app/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //creating a method to change screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 2),(){
      //using getX
      // Get.to(()=>const LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if(user==null && mounted){
          Get.offAll(()=>const LoginScreen());
        }else{
          Get.offAll(()=> const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            280.heightBox,
            appLogoWidget(),
            10.heightBox,
            appName.text.fontWeight(FontWeight.bold).size(24).white.make(),
            5.heightBox,
            appVersion.text.white.size(12).make(),
            const Spacer(),
            credits.text.white.fontFamily(semiBold).make(),
            30.heightBox,
            // Our splash screen UI is completed.
          ],
        ),
      ),
    );
  }
}
