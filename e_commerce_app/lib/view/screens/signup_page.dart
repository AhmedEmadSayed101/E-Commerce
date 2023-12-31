import 'package:e_commerce_app/common/colors.dart';
import 'package:e_commerce_app/controller/firebase_helper.dart';
import 'package:e_commerce_app/controller/signUp_controller.dart';
import 'package:e_commerce_app/view/widgets/dragger.dart';
import 'package:e_commerce_app/view/widgets/myButton.dart';
import 'package:e_commerce_app/view/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? datepicked;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.darkred,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 240,
                width: 240,
                child: LottieBuilder.asset("assets/animation/signupanim.json"),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 100,
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
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 80,
                          )),
                      MyTextField(
                          controller: emailController,
                          hint: "Email",
                          isPassword: false,
                          isNum: false,
                          width: 380,
                          pIcon: const Icon(Icons.alternate_email)),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          controller: passwordController,
                          hint: "Password",
                          isPassword: true,
                          isNum: false,
                          width: 380,
                          pIcon: const Icon(Icons.password)),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          controller: confirmPasswordController,
                          hint: "Confirm Password",
                          isPassword: true,
                          isNum: false,
                          width: 380,
                          pIcon: const Icon(Icons.password)),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          controller: userNameController,
                          hint: "User Name",
                          isPassword: false,
                          isNum: false,
                          width: 380,
                          pIcon: const Icon(Icons.pin)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 170,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 10,
                            runSpacing: 20,
                            children: [
                              MyTextField(
                                controller: weightController,
                                hint: "Weight",
                                isPassword: false,
                                isNum: true,
                                width: 170,
                                pIcon: const Icon(Icons.monitor_weight),
                              ),
                              MyTextField(
                                  controller: heightController,
                                  hint: "Height",
                                  isPassword: false,
                                  isNum: true,
                                  width: 190,
                                  pIcon: const Icon(Icons.height)),
                              Container(
                                width: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(color: MyColors.silver),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent)),
                                    onPressed: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      ).then((selectedDate) =>
                                          datepicked = selectedDate!);
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: MyColors.darkred,
                                        ),
                                        Text(
                                          "Age",
                                          style: TextStyle(
                                              color: MyColors.silver,
                                              fontSize: 20),
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 190,
                                child: GetBuilder<SignUpController>(
                                    init: SignUpController(),
                                    builder: (controller) {
                                      return Row(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Male",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: MyColors.silver),
                                              ),
                                              Radio(
                                                value: "male",
                                                groupValue: controller.gender,
                                                onChanged: (value) => controller
                                                    .changeGender(value),
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        MyColors.darkred),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Female",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: MyColors.silver),
                                              ),
                                              Radio(
                                                value: "female",
                                                groupValue: controller.gender,
                                                onChanged: (value) => controller
                                                    .changeGender(value),
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        MyColors.darkred),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyLittleButton(
                              logo: "assets/images/google.png",
                              fun: () {},
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
                      GetBuilder<SignUpController>(
                        builder: (controller) => ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty ||
                                userNameController.text.isEmpty ||
                                weightController.text.isEmpty ||
                                datepicked == null ||
                                heightController.text.isEmpty) {
                              Get.snackbar("Some Thing Went Wrong !",
                                  "Please Complete All Fields.",
                                  icon: const Icon(Icons.error));
                            } else {
                              FirebaseHelper()
                                  .signUp(emailController.text,
                                      passwordController.text)
                                  .then((_) {
                                Get.offAllNamed("/logIn");
                                FirebaseHelper().sendEmailVerification();
                              });
                            }
                          },
                          style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.only(right: 70, left: 70)),
                              backgroundColor:
                                  MaterialStatePropertyAll(MyColors.darkred)),
                          child: const Text(
                            "SignUp",
                            style:
                                TextStyle(color: MyColors.silver, fontSize: 30),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed("/logIn");
                          },
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: "Already have account? ",
                                  style: TextStyle(color: MyColors.silver)),
                              TextSpan(
                                  text: "LogIn",
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
