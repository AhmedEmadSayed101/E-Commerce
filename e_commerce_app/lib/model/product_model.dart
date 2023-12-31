class Product {
  String? gender;
  int? id;
  String? name;
  double? price;
  bool? favourite = false;

  Product(
      {required this.gender,
      required this.id,
      required this.name,
      required this.price,
      this.favourite});

  factory Product.fromJson(Map json) {
    return Product(
      gender: json['Gender '],
      id: json['ID'],
      name: json['Name '],
      price: json['Price '].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Gender': gender,
      'ID': id,
      'Name': name,
      'Price': price,
    };
  }
}
