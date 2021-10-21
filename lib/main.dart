import 'package:flutter/material.dart';
import 'package:milkrunclone/home_stack.dart';
import 'package:milkrunclone/homeitems/home.dart';
import 'package:milkrunclone/homeitems/home/view_category.dart';
import 'package:milkrunclone/homeitems/profile.dart';
import 'package:milkrunclone/models/parent_categories.dart';
import 'package:milkrunclone/providers/cart_provider.dart';
import 'package:milkrunclone/providers/parent_category_provider.dart';
import 'package:milkrunclone/providers/products_provider.dart';
import 'package:milkrunclone/route_constants.dart';
import 'package:provider/provider.dart';

import 'homeitems/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ParentCategoryProvider>.value(
            value: ParentCategoryProvider()),
        ChangeNotifierProvider<ProductsProvider>.value(
            value: ProductsProvider()),
        ChangeNotifierProvider<CartProvider>.value(value: CartProvider())
      ],
      child: MaterialApp(
        title: 'MilkRunClone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeStack(),
        routes: {
          RouteConstants.homeId: (context) => Home(),
          RouteConstants.cartId: (context) => Cart(),
          RouteConstants.profileId: (context) => Profile(),
          RouteConstants.viewCategory: (context) => ViewCategory()
        },
      ),
    );
  }
}
