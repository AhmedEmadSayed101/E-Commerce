import 'package:e_commerce_app/common/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Get.snackbar("Something Went Wrong !", "This Email is Already signedUp",
            icon: const Icon(
              Icons.error,
              color: MyColors.grana,
            ));
        rethrow;
      }
    }
  }

  Future<UserCredential> login(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future signout() async {
    auth.signOut();
  }

  Future sendEmailVerification() async {
    await auth.currentUser?.sendEmailVerification();
  }

  Future resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
