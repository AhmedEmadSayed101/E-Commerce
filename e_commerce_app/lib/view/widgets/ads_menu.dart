import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/view/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdsMenu extends StatelessWidget {
  AdsMenu({super.key});
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(color: MyColors.backGround),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: SizedBox(
              width: 380,
              child: SearchBar(
                backgroundColor: const MaterialStatePropertyAll(MyColors.back),
                hintText: "Search Products",
                textStyle: const MaterialStatePropertyAll(
                    TextStyle(color: MyColors.silver)),
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: MyColors.darkred,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 600,
            child: PageView(
              controller: _controller,
              children: const [
                OfferCard(
                    width1: 180,
                    width2: 145,
                    offerImage1: "assets/images/sale.webp",
                    offerImage2: "assets/images/sale3.png"),
                OfferCard(
                    width1: 170,
                    width2: 190,
                    offerImage1: "assets/images/sale2.webp",
                    offerImage2: "assets/images/sale4.webp"),
                OfferCard(
                  width1: 160,
                  width2: 200,
                  offerImage2: "assets/images/sale5.png",
                  offerImage1: "assets/images/sale6.png",
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SizedBox(
                height: 20,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: MyColors.darkred),
                ),
              )),
        ],
      ),
    );
  }
}
