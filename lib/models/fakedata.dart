import 'package:milkrunclone/models/categories.dart';
import 'package:milkrunclone/models/parent_categories.dart';
import 'package:milkrunclone/models/product.dart';

class FakeData {
  static List<ParentCategories> createFakeData() {
    List<ParentCategories> parentCategoriesList = [];
    //Fruit and Vegetables
    ParentCategories parentCategory =
        new ParentCategories(name: 'Fruit and Vegetables', categories: []);
    parentCategory.categories.addAll(<Categories>[
      new Categories(name: 'Vegetable', products: [
        new Product(title: 'Carrot Single', price: 0.69),
        new Product(title: 'Cherry Tomatos', price: 3.99),
        new Product(title: 'Cucumber', price: 1.50)
      ]),
      new Categories(name: 'Fruit', products: [
        new Product(title: 'Avocado', price: 1.89),
        new Product(title: 'Bananas', price: 3.99),
        new Product(title: 'Strawberries', price: 1.50)
      ])
    ]);
    parentCategoriesList.add(parentCategory);

    //Meat and Seafood
    parentCategory =
        new ParentCategories(name: 'Meat and Seafood', categories: []);
    parentCategory.categories.addAll(<Categories>[
      new Categories(name: 'Beef', products: [
        new Product(title: 'Beef Mince', price: 12.95),
        new Product(title: 'Rump Steak', price: 9.99),
        new Product(title: 'Eye Fillet', price: 13.49)
      ]),
      new Categories(name: 'Chicken', products: [
        new Product(title: 'Free Range Chicken Breast 2 Pack', price: 11.00),
        new Product(title: 'Free Range Chicken Thigh 4 Pack', price: 10.00),
      ])
    ]);
    parentCategoriesList.add(parentCategory);

    return parentCategoriesList;
  }
}
