// To parse this JSON data, do
//
//     final pizza = pizzaFromJson(jsonString);

import 'dart:convert';

Pizza pizzaFromJson(String str) => Pizza.fromJson(json.decode(str));

String pizzaToJson(Pizza data) => json.encode(data.toJson());

class Pizza {
  Pizza({
    this.id,
    this.name,
    this.isVeg,
    this.description,
    this.defaultCrust,
    this.crusts,
  });

  String? id;
  String? name;
  bool? isVeg;
  String? description;
  int? defaultCrust;
  List<Crust>? crusts;

  factory Pizza.fromJson(Map<String, dynamic> json) => Pizza(
        id: json["id"],
        name: json["name"],
        isVeg: json["isVeg"],
        description: json["description"],
        defaultCrust: json["defaultCrust"],
        crusts: List<Crust>.from(json["crusts"].map((x) => Crust.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isVeg": isVeg,
        "description": description,
        "defaultCrust": defaultCrust,
        "crusts": List<dynamic>.from(crusts!.map((x) => x.toJson())),
      };
}

class Crust {
  Crust({
    this.id,
    this.name,
    this.defaultSize,
    this.sizes,
  });

  int? id;
  String? name;
  int? defaultSize;
  List<Size>? sizes;

  factory Crust.fromJson(Map<String, dynamic> json) => Crust(
        id: json["id"],
        name: json["name"],
        defaultSize: json["defaultSize"],
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "defaultSize": defaultSize,
        "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
      };
}

class Size {
  Size({
    this.id,
    this.name,
    this.price,
  });

  int? id;
  String? name;
  int? price;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
