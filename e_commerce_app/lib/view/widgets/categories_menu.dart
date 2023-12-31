import 'package:e_commerce_app/view/widgets/category_button.dart';
import 'package:flutter/material.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        width: MediaQuery.maybeSizeOf(context)?.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CategoryButton(
              icon: "assets/images/all.png",
              name: "𝐀𝐥𝐥 𝐂𝐚𝐭𝐞𝐠𝐨𝐫𝐢𝐞𝐬",
              textSize: 17,
            ),
            CategoryButton(
              icon: "assets/images/men.png",
              name: "𝐌𝐞𝐧",
              textSize: 20,
            ),
            CategoryButton(
              icon: "assets/images/women.png",
              name: "𝐖𝐨𝐦𝐞𝐧",
              textSize: 20,
            ),
            CategoryButton(
              icon: "assets/images/casual.png",
              name: "𝐂𝐚𝐬𝐮𝐚𝐥",
              textSize: 20,
            ),
            CategoryButton(
              icon: "assets/images/sport.png",
              name: "𝐒𝐩𝐨𝐫𝐭",
              textSize: 20,
            ),
            CategoryButton(
              icon: "assets/images/formal.png",
              name: "𝐅𝐨𝐫𝐦𝐚𝐥",
              textSize: 20,
            ),
            CategoryButton(
              icon: "assets/images/outfits.png",
              name: "𝐎𝐮𝐭𝐅𝐢𝐭𝐬",
              textSize: 20,
            ),
          ],
        ));
  }
}
