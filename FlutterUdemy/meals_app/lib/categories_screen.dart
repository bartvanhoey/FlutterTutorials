import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('DeliMeal')),
      body: GridView(
      // ignore: prefer_const_constructors
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        ...DUMMY_CATEGORIES.map((category) => CategoryItem(id: category.id, title: category.title, color: category.color)).toList()
      ],
    ));
  }
}
