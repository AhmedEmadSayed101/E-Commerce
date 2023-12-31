import 'dart:io';

class User {
  File? image;
  String email;
  String password;
  String userName;
  double weight;
  double height;
  int age;
  Gender gender;

  User({
    this.image,
    required this.email,
    required this.password,
    required this.userName,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });
}

enum Gender {
  male,
  female,
  other,
}
