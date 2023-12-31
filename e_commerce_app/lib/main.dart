//import 'package:e_commerce_app/controller/product_firebase_helper.dart';
import 'package:e_commerce_app/controller/firebase_helper.dart';
import 'package:e_commerce_app/view/screens/cart_page.dart';
import 'package:e_commerce_app/view/screens/home_page.dart';
import 'package:e_commerce_app/view/screens/login_page.dart';
import 'package:e_commerce_app/view/screens/nav_bar.dart';
import 'package:e_commerce_app/view/screens/profile_page.dart';
import 'package:e_commerce_app/view/screens/signup_page.dart';
import 'package:e_commerce_app/view/screens/wish_page.dart';
import 'package:e_commerce_app/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ProductFirebaseHelper().getImageUrl("1");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          FirebaseHelper().auth.currentUser != null ? "/logIn" : "/navPage",
      getPages: [
        GetPage(name: "/signUp", page: () => SignUpPage()),
        GetPage(name: "/logIn", page: () => LogInPage()),
        GetPage(name: "/home", page: () => const Home()),
        GetPage(name: "/navPage", page: () => NavBar()),
        GetPage(name: "/cartPage", page: () => const CartPage()),
        GetPage(name: "/wishPage", page: () => const WishPage()),
        GetPage(name: "/profilePage", page: () => const ProfilePage()),
        GetPage(name: "/productDetails", page: () => const ProductDetails()),
      ],
    );
  }
}
