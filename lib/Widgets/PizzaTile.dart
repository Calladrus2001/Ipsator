import 'package:flutter/material.dart';
import 'package:ipsator/Models/PizzaModel.dart';

class PizzaTile {
  Widget buildTile(Pizza pizza) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.deepOrangeAccent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pizza.name!),
        ],
      ),
    );
  }
}
