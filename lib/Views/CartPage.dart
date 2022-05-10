import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int total = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        /// background
        Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white),

        /// checking for empty cart
        total == 0
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: 200),
                      Image(
                        image: AssetImage("assets/images/pizza.jpg"),
                        height: 220,
                        width: 220,
                      ),
                      Text(
                        "Your cart is empty, Let's add a Pizza !",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 32),
                      GestureDetector(
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_rounded, color: Colors.white),
                                SizedBox(width: 6),
                                Text("Add",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ),
              )

            /// return list of pizzas chosen (detailed)
            : Column(),
      ],
    ));
  }
}
