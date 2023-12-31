import 'package:flutter/material.dart';

class Dragger extends StatelessWidget {
  const Dragger({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 5,
        width: 120,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
