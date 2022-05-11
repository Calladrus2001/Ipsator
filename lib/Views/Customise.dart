import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipsator/Models/CartItemModel.dart';
import '../Models/PizzaModel.dart';

class Customise extends StatefulWidget {
  const Customise({Key? key}) : super(key: key);

  @override
  State<Customise> createState() => _CustomiseState();
}

class _CustomiseState extends State<Customise> {
  Pizza pizza = Get.arguments;
  int crust_id = 0;
  int size_id = 0;
  late List<CartItem> cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 60),

                /// button to go back to menu
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: Row(children: [
                      Icon(Icons.chevron_left_rounded,
                          color: Colors.deepOrangeAccent),
                      Text("Menu",
                          style: TextStyle(
                              fontSize: 14, color: Colors.deepOrangeAccent))
                    ]),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 18),

                /// image
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      image: AssetImage("assets/images/nonveg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 18),

                /// name and isVeg icon
                Row(
                  children: [
                    Expanded(
                      child: Text(pizza.name!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1)),
                    ),
                    Icon(Icons.circle, color: Colors.red, size: 14)
                  ],
                ),
                SizedBox(height: 8),

                /// pizza description
                Text(pizza.description!, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 24),

                /// Crust
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Crust",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 16),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: pizza.crusts!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 50,
                            width: 130,
                            child: ListTile(
                              title: Text(pizza.crusts![index].name.toString(),
                                  style: TextStyle(fontSize: 14)),
                              onTap: () {
                                setState(() {
                                  crust_id = index;
                                  size_id = 0;
                                });
                              },
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 1, color: Colors.deepOrangeAccent)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),

                /// Sizes
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Sizes",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 16),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: pizza.crusts![crust_id].sizes!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 50,
                            width: 130,
                            child: ListTile(
                              title: Text(
                                  pizza.crusts![crust_id].sizes![index].name
                                      .toString(),
                                  style: TextStyle(fontSize: 14)),
                              onTap: () {
                                setState(() {
                                  size_id = index;
                                });
                              },
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    width: 1, color: Colors.deepOrangeAccent)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),

                /// Price
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Price: ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.w700)),
                    ),
                    Text(
                        "\u{20B9}" +
                            pizza.crusts![crust_id].sizes![size_id].price
                                .toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700))
                  ],
                ),
                SizedBox(height: 24),

                /// Add Button
                Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
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
                        CartItem item = CartItem(
                            pizza.name,
                            pizza.crusts![crust_id].name,
                            pizza.crusts![crust_id].sizes![size_id].name,
                            1,
                            pizza.crusts![crust_id].sizes![size_id].price);
                        cart = [item];
                        //TODO : enter list into a local storage
                        Get.back();
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
