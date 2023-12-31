import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/firebase_helper.dart';
import 'package:e_commerce_app/view/widgets/dragger.dart';
import 'package:e_commerce_app/view/widgets/myButton.dart';
import 'package:e_commerce_app/view/widgets/myTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.grana,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 240,
                width: 240,
                child: LottieBuilder.asset("assets/animation/loginanim.json"),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: MyColors.backGround,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Dragger(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "       Welcome Back ! \n",
                                style: TextStyle(
                                    color: MyColors.darkred,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Please LogIn",
                                style: TextStyle(
                                    color: MyColors.silver,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                      ),
                      MyTextField(
                          controller: loginemailController,
                          hint: "Email",
                          isPassword: false,
                          isNum: false,
                          width: 380,
                          pIcon: const Icon(Icons.alternate_email)),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          controller: loginpasswordController,
                          hint: "Password",
                          isPassword: true,
                          isNum: false,
                          width: 380,
                          pIcon: const Icon(Icons.password)),
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: TextButton(
                            onPressed: () {
                              FirebaseHelper()
                                  .resetPassword(loginemailController.text);
                            },
                            child: const Text(
                              "Forgot Password ?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyLittleButton(
                              logo: "assets/images/google.png",
                              fun: () {
                                signInWithGoogle();
                              },
                            ),
                            MyLittleButton(
                              logo: "assets/images/facebook.png",
                              fun: () {},
                            ),
                            MyLittleButton(
                              logo: "assets/images/x.png",
                              fun: () {},
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseHelper()
                              .login(loginemailController.text,
                                  loginpasswordController.text)
                              .then((credential) {
                            if (credential.user!.emailVerified) {
                              Get.offAllNamed("/navPage");
                            } else {
                              Get.snackbar("Something Went Wrong !",
                                  "Please Verify Your Account",
                                  icon: const Icon(
                                    Icons.error,
                                    color: MyColors.grana,
                                  ));
                            }
                          });
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.only(right: 70, left: 70)),
                            backgroundColor:
                                MaterialStatePropertyAll(MyColors.darkred)),
                        child: const Text(
                          "LogIn",
                          style:
                              TextStyle(color: MyColors.silver, fontSize: 30),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed("/signUp");
                          },
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: "Don't have account? ",
                                  style: TextStyle(color: MyColors.silver)),
                              TextSpan(
                                  text: "SignUp",
                                  style: TextStyle(color: MyColors.darkred))
                            ]),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
