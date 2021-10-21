import 'package:milkrunclone/models/product.dart';

class Categories {
  final String name;
  final List<Product> products;

  Categories({required this.name, required this.products});

  //If getting from api then we will have to build model of json
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(name: json['name'], products: json['products']);
  }
}
