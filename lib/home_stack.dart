import 'package:flutter/material.dart';
import 'package:milkrunclone/homeitems/cart.dart';
import 'package:milkrunclone/homeitems/home.dart';
import 'package:milkrunclone/homeitems/profile.dart';
import 'package:milkrunclone/homeitems/search.dart';

import 'route_constants.dart';

class HomeStack extends StatefulWidget {
  static String id = RouteConstants.homeStackId;

  @override
  _HomeStackState createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  PageController _homeStackPageController = new PageController();
  int _selectedHomeStackIndex = 0;

  void _bottomBarTappedItem(int index) {
    setState(() {
      _selectedHomeStackIndex = index;
      _homeStackPageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _homeStackPageController,
        onPageChanged: (int index) {
          //If the page changes then this will be handled here
        },
        children: <Widget>[Home(), Search(), Cart()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
        ],
        currentIndex: _selectedHomeStackIndex,
        onTap: _bottomBarTappedItem,
      ),
    );
  }
}
