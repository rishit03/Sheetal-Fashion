import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/views/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/views/category_screen/category_screen.dart';
import 'package:ecommerce_app/views/home_screen/home_screen.dart';
import 'package:ecommerce_app/views/user_screen/user_screen.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    //init home controller
    var controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icUser, width: 26), label: user),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const UserScreen(),
    ];

    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value),)),
        ],
      ),
      bottomNavigationBar: Obx(
            ()=> BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(fontFamily: semiBold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navBarItem,
            onTap: (value){
              controller.currentNavIndex.value = value;

              },
            ),
        ),
    );
  }
}
