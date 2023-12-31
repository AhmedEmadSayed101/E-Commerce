import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/productdetails_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SizeMenu extends StatelessWidget {
  const SizeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        builder: (sizeController) =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Item Size: ",
                style: TextStyle(
                    color: MyColors.silver,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              CupertinoSlidingSegmentedControl(
                  thumbColor: MyColors.grana,
                  children: const {
                    0: Text(
                      "S",
                      style: TextStyle(color: MyColors.silver, fontSize: 20),
                    ),
                    1: Text("M",
                        style: TextStyle(color: MyColors.silver, fontSize: 20)),
                    2: Text("L",
                        style: TextStyle(color: MyColors.silver, fontSize: 20)),
                    3: Text("XL",
                        style: TextStyle(color: MyColors.silver, fontSize: 20))
                  },
                  groupValue: sizeController.sliding,
                  onValueChanged: (newValue) {
                    sizeController.changeSize(newValue);
                  })
            ]));
  }
}
