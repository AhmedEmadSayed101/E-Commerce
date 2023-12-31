import 'package:e_commerce_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RatingBarr extends StatelessWidget {
  const RatingBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rating: ",
          style: TextStyle(
              color: MyColors.silver,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RatingBar.builder(
              itemSize: 40,
              initialRating: 0.5,
              minRating: 0.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              unratedColor: MyColors.back,
              onRatingUpdate: (rating) {},
            ),
            TextButton(
              onPressed: () {
                Get.snackbar("Done !", "Thank You For Your Rating",
                    icon: Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ));
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20, color: MyColors.grana),
              ),
            )
          ],
        ),
      ],
    );
  }
}
