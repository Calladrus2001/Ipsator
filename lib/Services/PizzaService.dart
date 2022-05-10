import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ipsator/Models/PizzaModel.dart';

class PizzaService {
  Future<Pizza> getPizzas() async {
    final String url =
        "https://625bbd9d50128c570206e502.mockapi.io/api/v1/pizza/1";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString);
      return pizzaFromJson(responseString);
    } else {
      return jsonDecode(response.body);
    }
  }
}
