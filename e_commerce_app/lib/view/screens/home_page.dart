import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/firebase_helper.dart';
import 'package:e_commerce_app/controller/products_controller.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widgets/ads_menu.dart';
import 'package:e_commerce_app/view/widgets/categories_menu.dart';
import 'package:e_commerce_app/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/controller/nav_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NavController(),
        builder: (navController) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 80,
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navController.changeIndex(3);
                      },
                      child: Stack(alignment: Alignment.center, children: [
                        SizedBox(
                          width: 83,
                          child: LottieBuilder.asset(
                            "assets/animation/backAnim3.json",
                          ),
                        ),
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/images/medoPalestine.jpg",
                          ),
                        ),
                      ]),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "𝓗𝓮𝓵𝓵𝓸, ",
                            style: TextStyle(
                                fontSize: 20, color: MyColors.darkred),
                          ),
                          TextSpan(
                            text: "Ahmed",
                            style:
                                TextStyle(fontSize: 30, color: MyColors.silver),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                backgroundColor: MyColors.backGround,
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.snackbar("Notification 🔔",
                            "Sorry, You Don't have any Notifications to View");
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: MyColors.darkred,
                      )),
                  IconButton(
                      onPressed: () {
                        Get.snackbar("Notification 🔔",
                            "You have Successfully Logged Out of your Account");
                        FirebaseHelper().signout();
                        Get.offAllNamed("/logIn");
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: MyColors.darkred,
                      )),
                ],
              ),
              backgroundColor: MyColors.backGround,
              body: FutureBuilder(
                  future: ProductsController().fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      List<Product> products = snapshot.data ?? [];
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            centerTitle: true,
                            backgroundColor: MyColors.backGround,
                            expandedHeight: 400,
                            toolbarHeight: 120,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(
                              title: const CategoriesMenu(),
                              collapseMode: CollapseMode.pin,
                              background: AdsMenu(),
                              titlePadding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              expandedTitleScale: 1,
                            ),
                          ),
                          SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisExtent: 320,
                              mainAxisSpacing: 8.0,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                final product = products[index];
                                return ProductCard(
                                  product: product,
                                );
                              },
                              childCount: products.length,
                            ),
                          )
                        ],
                      );
                    }
                  }),
            ));
  }
}
