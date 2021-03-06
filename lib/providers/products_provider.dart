import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milkrunclone/models/categories.dart';
import 'package:milkrunclone/models/fakedata.dart';
import 'package:milkrunclone/models/parent_categories.dart';
import 'package:milkrunclone/models/product.dart';

class ProductsProvider extends ChangeNotifier {
  final _streamControllerProducts = StreamController<List<Product>>();
  Stream<List<Product>> get productsStream {
    return _streamControllerProducts.stream;
  }

  final _streamControllerCategories = StreamController<List<Categories>>();
  Stream<List<Categories>> get productsCategoryStream {
    return _streamControllerCategories.stream;
  }

  void getProductCategories(String parentCategoryName) {
    List<ParentCategories> fakeData = FakeData.createFakeData();
    ParentCategories parentCategory =
        fakeData.where((element) => element.name == parentCategoryName).first;
    parentCategory.categories.insert(0, Categories(name: 'All', products: []));
    _streamControllerCategories.add(parentCategory.categories);
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
    _streamControllerProducts.add(allProducts);
  }

  void filterProductsByCategory(String productCategory, String parentName) {
    List<ParentCategories> fakeData = FakeData.createFakeData();
    if (productCategory == 'All') {
      getAllProductsFromParent(parentName);
      return;
    }

    ParentCategories parentCategory =
        fakeData.where((element) => element.name == parentName).first;
    Categories category = parentCategory.categories
        .where((element) => element.name == productCategory)
        .first;
    _streamControllerProducts.add(category.products);
  }
}
