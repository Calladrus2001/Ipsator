import 'package:flutter/material.dart';
import 'package:ipsator/Pages/CartPage.dart';
import 'package:ipsator/Models/PizzaModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool cartEmpty = true;
  int total = 0;

  /// REST API for pizza data
  Future<Pizza?> getPizzas() async {
    final String url =
        "https://625bbd9d50128c570206e502.mockapi.io/api/v1/pizza/1";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return pizzaFromJson(responseString);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    getPizzas();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            /// background
            Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white),

            /// return list of pizzas chosen (detailed)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CircularProgressIndicator(
                        color: Colors.deepOrangeAccent)),
                SizedBox(height: 24),
                Text("Fetching delicious pizzas for you!",
                    style: TextStyle(color: Colors.grey))
              ],
            ),

            /// cart button -> payment screen
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 32,
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_rounded,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "$total",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffF2F4F6),
                          border: Border.all(width: 0.5, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  onTap: () {
                    Get.to(() => Cartpage(), arguments: total);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
