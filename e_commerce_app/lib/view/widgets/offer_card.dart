import 'package:e_commerce_app/common/colors.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String offerImage1;
  final String offerImage2;
  final double width1;
  final double width2;
  const OfferCard(
      {super.key,
      required this.offerImage1,
      required this.offerImage2,
      required this.width1,
      required this.width2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 600,
        child: Card(
          color: MyColors.back,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset(
              offerImage1,
              width: width1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  offerImage2,
                  width: width2,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
