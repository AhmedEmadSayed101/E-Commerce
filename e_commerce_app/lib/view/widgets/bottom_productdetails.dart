import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomProductDetails extends StatelessWidget {
  const BottomProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        builder: (productDetailsController) => Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height - 730,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: MyColors.back,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              productDetailsController.minusQuantity();
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            "${productDetailsController.quantity}",
                            style: const TextStyle(
                                color: MyColors.silver, fontSize: 25),
                          ),
                          IconButton(
                              onPressed: () {
                                productDetailsController.addQuantity();
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: "\$ ",
                          style:
                              TextStyle(color: MyColors.darkred, fontSize: 25),
                        ),
                        TextSpan(
                          text: "${productDetailsController.finalPrice}",
                          style: const TextStyle(
                              color: MyColors.silver, fontSize: 25),
                        )
                      ]))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          style: const ButtonStyle(
                              iconColor:
                                  MaterialStatePropertyAll(MyColors.darkred),
                              backgroundColor: MaterialStatePropertyAll(
                                  MyColors.backGround)),
                          onPressed: () {
                            Get.snackbar("Done !", "Added To Cart",
                                icon: const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: MyColors.grana,
                                ));
                          },
                          icon: const Icon(Icons.shopping_bag),
                          label: const Text(
                            "Add To Cart",
                            style: TextStyle(color: MyColors.silver),
                          )),
                      ElevatedButton.icon(
                          style: const ButtonStyle(
                              iconColor:
                                  MaterialStatePropertyAll(MyColors.darkred),
                              backgroundColor: MaterialStatePropertyAll(
                                  MyColors.backGround)),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.payments_outlined,
                            size: 30,
                          ),
                          label: const Text(
                            "Check Out",
                            style: TextStyle(
                              color: MyColors.silver,
                              fontSize: 30,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ));
  }
}
