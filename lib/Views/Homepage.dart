import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:ipsator/Models/CartItemModel.dart';
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
  final box = GetStorage();

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
        floatingActionButton: Badge(
          badgeContent: Text("$total", style: TextStyle(color: Colors.white)),
          badgeColor: Colors.deepOrangeAccent,
          child: FloatingActionButton(
            child: Icon(Icons.shopping_cart_outlined,
                color: Colors.deepOrangeAccent),
            backgroundColor: Colors.white,
            onPressed: () {
              Get.to(() => Cartpage());
            },
          ),
        ),
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
                        PizzaTile().buildTile(context, _pizza),
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
          ],
        ));
  }
}
