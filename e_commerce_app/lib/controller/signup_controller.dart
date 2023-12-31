import 'package:get/get.dart';

class SignUpController extends GetxController {
  String? gender;
  changeGender(var selectedGender) {
    gender = selectedGender;
    update();
  }
}
