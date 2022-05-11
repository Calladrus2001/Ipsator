import 'package:flutter/material.dart';
import 'package:ipsator/Models/PizzaModel.dart';
import 'package:get/get.dart';
import 'package:ipsator/Views/Customise.dart';

class PizzaTile {
  Widget buildTile(BuildContext context, Pizza pizza) {
    Color clr1;
    if (pizza.isVeg!) {
      clr1 = Colors.green;
    } else {
      clr1 = Colors.red;
    }
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.deepOrangeAccent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
        title: Text(pizza.name!, style: TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Column(
          children: [
            Text(
              pizza.description!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                    "\u{20B9}" + pizza.crusts![0].sizes![0].price.toString(),
                    style: TextStyle(color: Colors.black)))
          ],
        ),
        isThreeLine: true,
        trailing: GestureDetector(
          child: Icon(
            Icons.circle,
            color: clr1,
            size: 14,
          ),
        ),

        /// to customise the pizza
        onTap: () {
          Get.to(() => Customise(), arguments: pizza);
        },
      ),
    );
  }
}
