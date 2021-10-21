import 'package:flutter/material.dart';
import 'package:milkrunclone/homeitems/home/home_header.dart';
import 'package:milkrunclone/models/parent_categories.dart';
import 'package:milkrunclone/providers/parent_category_provider.dart';
import 'package:milkrunclone/route_constants.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String id = RouteConstants.homeId;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<ParentCategoryProvider>(context).getParentCategories();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Home_Header(),
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: _createParentCategoriesList(),
    );
  }

  Widget _createParentCategoriesList() {
    return Consumer<ParentCategoryProvider>(
        builder: (context, parentCategories, child) {
      return StreamBuilder(
          stream: parentCategories.categoriesStream,
          builder: (context, AsyncSnapshot<List<ParentCategories>> snapshot) {
            if (snapshot.hasData) return _createItemList(snapshot.data);
            return Text('No Data Present');
          });
    });
  }

  Widget _createItemList(List<ParentCategories>? snapshot) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 2),
        shrinkWrap: true,
        itemCount: snapshot!.length,
        itemBuilder: (context, index) {
          ParentCategories categoryItem = snapshot[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteConstants.viewCategory,
                  arguments: categoryItem);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      '${categoryItem.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
