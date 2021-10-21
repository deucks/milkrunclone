import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:milkrunclone/models/categories.dart';
import 'package:milkrunclone/models/parent_categories.dart';
import 'package:milkrunclone/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ViewCategory extends StatefulWidget {
  static String id = ViewCategory.id;

  @override
  _ViewCategoryState createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  late ParentCategories _routedCategory;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _routedCategory =
        ModalRoute.of(context)!.settings.arguments as ParentCategories;
    final subCategoryProvider = Provider.of<ProductsProvider>(context)
        .getProductCategories(_routedCategory.name);

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [_createSubCategory()],
      ),
    );
  }

  Widget createTitle() {
    return Container(
      child: Text(
        '${_routedCategory.name}',
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  Widget _createSubCategory() {
    return Consumer<ProductsProvider>(
        builder: (context, productCategories, child) {
      return StreamBuilder(
          stream: productCategories.productsCategoryStream,
          builder: (context, AsyncSnapshot<List<Categories>> snapshot) {
            if (snapshot.hasData) return _createSubCategoryList(snapshot.data);
            return Text('There is no data');
          });
    });
  }

  Widget _createSubCategoryList(List<Categories>? snapshot) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.builder(
          itemBuilder: (context, index) {
            Categories category = snapshot![index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                child: Text(category.name),
              ),
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: snapshot!.length,
        ),
      ),
    );
  }
}
