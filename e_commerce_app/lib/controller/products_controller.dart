import 'package:e_commerce_app/controller/products_api.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  Future<List<Product>> fetchData() async {
    List<Product> products = [];
    await ProductApi().getData().then(
        (value) => products.addAll(value.map((e) => Product.fromJson(e))));
    return products;
  }
}
