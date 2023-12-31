import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/productdetails_controller.dart';
import 'package:e_commerce_app/view/widgets/bottom_productdetails.dart';
import 'package:e_commerce_app/view/widgets/rating_bar.dart';
import 'package:e_commerce_app/view/widgets/size_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as Map;

    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        builder: (productDetailsController) => Scaffold(
              appBar: AppBar(
                backgroundColor: MyColors.backGround,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: MyColors.silver,
                      size: 30,
                    )),
                actions: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: MyColors.back,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: MyColors.darkred,
                          ))),
                  IconButton(
                      onPressed: () {
                        Get.toNamed("cartPage");
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: MyColors.silver,
                        size: 30,
                      ))
                ],
              ),
              backgroundColor: MyColors.backGround,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.network(
                        details["image"],
                        width: 160,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          details["data"].name,
                          style: const TextStyle(
                              color: MyColors.silver,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizeMenu(),
                        SizedBox(
                          height: 20,
                        ),
                        RatingBarr(),
                      ],
                    ),
                  ),
                  const BottomProductDetails()
                ],
              ),
            ));
  }
}
