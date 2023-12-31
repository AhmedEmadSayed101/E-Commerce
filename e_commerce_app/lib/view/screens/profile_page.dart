import 'package:e_commerce_app/common/colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.backGround,
      body: Center(
        child: Text(
          "Profile",
          style: TextStyle(color: MyColors.silver),
        ),
      ),
    );
  }
}
