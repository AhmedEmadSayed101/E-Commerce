import 'package:e_commerce_app/common/colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.backGround,
      body: Center(
        child: Text("Cart"),
      ),
    );
  }
}
