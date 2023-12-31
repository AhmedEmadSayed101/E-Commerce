import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  int quantity = 1;
  double productPrice = 150.99;
  late double finalPrice = productPrice;
  addQuantity() {
    quantity++;
    finalPrice = productPrice * quantity;
    update();
  }

  minusQuantity() {
    if (quantity > 1) {
      quantity--;
      finalPrice = productPrice * quantity;
    }
    update();
  }

  int sliding = 0;

  changeSize(int? newValue) {
    sliding = newValue!;
    update();
  }
}
