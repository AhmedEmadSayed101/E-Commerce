import 'package:e_commerce_app/model/product_model.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  RxList favProducts = [].obs;

  addToFavourites(Product product) {
    if (favProducts.contains(product)) {
      print("founded");
    } else {
      favProducts.add(product);
      product.favourite = true;
      update();
    }
  }
}
