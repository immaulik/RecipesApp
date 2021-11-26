import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../category_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(title: e.title, color: e.color, id: e.id))
          .toList(),
    );
  }
}
