import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApi {
  List data = [];
  Future<List> getData() async {
    var url = Uri.parse(
        "https://ecommerce-c36ef-default-rtdb.firebaseio.com/home.json");
    var response = await http.get(url);
    data = (jsonDecode(response.body));
    return data;
  }
}
