import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipsator/Models/CartItemModel.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final box = GetStorage();
  List<CartItem> cart = [];
  var total;

  /// method to build cart-item, implemented here instead of a separate widget because of State concerns
  Widget BuildTile(BuildContext context, CartItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
      child: Material(
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          height: 100,
          width: double.infinity,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(item.name.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ))),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Chip(
                        label: Text(item.crust.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                      SizedBox(width: 6),
                      Chip(
                        label: Text(item.size.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        backgroundColor: Colors.deepOrangeAccent,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  GestureDetector(
                      child: Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.deepOrangeAccent,
                        size: 30,
                      ),
                      onTap: () {
                        setState(() {
                          item.quantity -= 1;
                          if (item.quantity == 0) {
                            cart.remove(item);
                            box.write("cart", cart);
                          }
                        });
                      }),
                  Text(item.quantity.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  GestureDetector(
                      child: Icon(
                        Icons.add_circle_rounded,
                        color: Colors.deepOrangeAccent,
                        size: 30,
                      ),
                      onTap: () {
                        setState(() {
                          if (item.quantity < 9) {
                            item.quantity += 1;
                          }
                        });
                      }),
                  SizedBox(width: 20),
                  Text("\u{20B9}" + "${item.quantity * item.price!.toInt()}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int tot_price = 0;
    int tot_items = 0;
    if (box.read("cart") == null) {
      total = 0;
    } else {
      cart = box.read("cart");
      total = cart.length;
    }
    for (int i = 0; i < cart.length; i++) {
      tot_price += cart[i].quantity * cart[i].price!.toInt();
      tot_items += cart[i].quantity;
    }
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
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  children: [
                    SizedBox(height: 60),
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
                    Container(
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: total,
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return BuildTile(context, cart[index]);
                          }),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text("Price: ",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.deepOrangeAccent)),
                        Text("\u{20B9}$tot_price",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text("Total Pizzas: " + "$tot_items",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
      ],
    ));
  }
}
