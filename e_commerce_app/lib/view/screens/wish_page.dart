import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/favourites_controller.dart';
import 'package:e_commerce_app/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishPage extends StatelessWidget {
  const WishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favouritescontroller = Get.put(FavouritesController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.backGround,
          title: const Text(
            "Your Wish List",
            style:
                TextStyle(color: MyColors.silver, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: MyColors.backGround,
        body: SizedBox(
          child: favouritescontroller.favProducts.isEmpty
              ? Text(
                  "You Have No Favourites Items yet !",
                  style: TextStyle(color: Colors.white),
                )
              : Obx(
                  () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 310),
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: favouritescontroller.favProducts[index]);
                    },
                    itemCount: favouritescontroller.favProducts.length,
                  ),
                ),
        ));
  }
}
