import 'package:e_commerce_app/common/colors.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String icon;
  final String name;
  final double textSize;
  const CategoryButton({
    super.key,
    required this.icon,
    required this.name,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Container(
              width: 60,
              decoration: const BoxDecoration(
                  color: MyColors.back,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  icon,
                  color: Colors.white,
                ),
                color: MyColors.darkred,
              )),
        ),
        Text(
          name,
          style: TextStyle(color: MyColors.grana, fontSize: textSize),
        )
      ],
    );
  }
}
