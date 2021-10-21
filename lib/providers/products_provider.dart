import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milkrunclone/models/categories.dart';
import 'package:milkrunclone/models/fakedata.dart';
import 'package:milkrunclone/models/parent_categories.dart';
import 'package:milkrunclone/models/product.dart';

class ProductsProvider extends ChangeNotifier {
  final _streamController = StreamController<List<Product>>();
  Stream<List<Product>> get productsStream {
    return _streamController.stream;
  }

  void getProductsFromCategory(
      String productCategoryName, String parentCategoryName) {}

  void getAllProductsFromParent(String parentName) {
    List<ParentCategories> parentCat = FakeData.createFakeData();
    List<Product> allProducts = [];

    ParentCategories parentCategory =
        parentCat.where((element) => element.name == parentName).first;
    for (Categories category in parentCategory.categories) {
      allProducts.addAll(category.products);
    }

    _streamController.add(allProducts);
    notifyListeners();
  }
}
