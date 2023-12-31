import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/favourites_controller.dart';
import 'package:e_commerce_app/controller/product_firebase_helper.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favouritescontroller = Get.put(FavouritesController());
    return FutureBuilder(
      future: ProductFirebaseHelper().getImageUrl(product.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return GestureDetector(
            onTap: () {
              Get.toNamed("/productDetails",
                  arguments: {"data": product, "image": snapshot.data});
            },
            child: SizedBox(
              height: 260,
              width: 180,
              child: Card(
                color: MyColors.back,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.gender!,
                          style: const TextStyle(color: MyColors.darkred),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: MyColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: IconButton(
                              onPressed: () {
                                favouritescontroller.addToFavourites(product);
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: MyColors.darkred,
                              )),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        snapshot.data,
                        width: double.infinity,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name!,
                          style: const TextStyle(
                              color: MyColors.silver,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 25,
                        ),
                        child: Row(
                          children: [
                            Text(
                              product.price.toString(),
                              style: const TextStyle(
                                color: MyColors.silver,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.star)
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        }
      },
    );
  }
}
