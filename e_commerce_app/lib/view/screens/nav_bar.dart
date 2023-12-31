import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/nav_controller.dart';
import 'package:e_commerce_app/view/screens/cart_page.dart';
import 'package:e_commerce_app/view/screens/home_page.dart';
import 'package:e_commerce_app/view/screens/profile_page.dart';
import 'package:e_commerce_app/view/screens/wish_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final List<Widget> screens = [
    const Home(),
    const CartPage(),
    const WishPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.backGround,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GetBuilder<NavController>(
              init: NavController(),
              builder: (controller) {
                return CurvedNavigationBar(
                  height: 60,
                  buttonBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  color: MyColors.back,
                  onTap: (v) {
                    controller.changeIndex(v);
                  },
                  index: controller.currentIndex,
                  items: [
                    Icon(
                      controller.currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: MyColors.grana,
                      size: 40,
                    ),
                    Icon(
                      controller.currentIndex == 1
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined,
                      color: MyColors.grana,
                      size: 40,
                    ),
                    Icon(
                      controller.currentIndex == 2
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: MyColors.grana,
                      size: 40,
                    ),
                    Icon(
                      controller.currentIndex == 3
                          ? Icons.person
                          : Icons.person_outline,
                      color: MyColors.grana,
                      size: 40,
                    ),
                  ],
                );
              }),
        ),
        body: GetBuilder<NavController>(
            init: NavController(),
            builder: (controller) => screens[controller.currentIndex]));
  }
}
