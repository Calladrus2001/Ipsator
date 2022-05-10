import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ipsator/Services/PizzaService.dart';
import 'package:ipsator/Views/CartPage.dart';
import 'package:ipsator/Models/PizzaModel.dart';
import 'package:ipsator/Widgets/PizzaTile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

late Pizza _pizza;

class _HomepageState extends State<Homepage> {
  bool haveData = false;
  bool cartEmpty = true;
  int total = 0;

  /// REST API call
  getData() async {
    _pizza = await PizzaService().getPizzas();
    if (_pizza != null) {
      setState(() {
        haveData = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
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
            haveData
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 80),
                        PizzaTile().buildTile(_pizza),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                            color: Colors.deepOrangeAccent),
                      ),
                      SizedBox(height: 32),
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
