// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyLittleButton extends StatelessWidget {
  final String logo;
  final VoidCallback fun;
  const MyLittleButton({super.key, required this.logo, required this.fun});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: IconButton(
          onPressed: () {
            fun;
          },
          icon: Image.asset(logo)),
    );
  }
}
