import 'package:flutter/material.dart';
import 'package:milkrunclone/route_constants.dart';

class Profile extends StatefulWidget {
  static String id = RouteConstants.profileId;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Prifle'),
    );
  }
}
