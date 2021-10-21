import 'package:flutter/material.dart';

class ViewCategory extends StatefulWidget {
  static String id = ViewCategory.id;

  @override
  _ViewCategoryState createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: createTitle(),
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Text('helo'),
      ),
    );
  }

  Widget createBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [],
    );
  }

  // Widget createCategorySlider() {
  //   return ListView.builder(itemBuilder: (context, index) {
  //     return
  //   });
  // }

  // Widget createCategorySliderItem(){
  //   return
  // }

  Widget createTitle() {
    return Container(
      child: Text(
        'Category',
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
