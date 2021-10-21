import 'package:flutter/material.dart';
import 'package:milkrunclone/route_constants.dart';

class Cart extends StatefulWidget {
  static String id = RouteConstants.cartId;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Text('hello'),
    );
  }
}
