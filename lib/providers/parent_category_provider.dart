import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milkrunclone/models/fakedata.dart';
import 'package:milkrunclone/models/parent_categories.dart';

class ParentCategoryProvider extends ChangeNotifier {
  final _streamController = StreamController<List<ParentCategories>>();
  Stream<List<ParentCategories>> get categoriesStream {
    return _streamController.stream;
  }

  void getParentCategories() {
    List<ParentCategories> parentCategories = FakeData.createFakeData();
    _streamController.add(parentCategories);
  }
}
