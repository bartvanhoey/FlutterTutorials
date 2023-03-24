import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle as String)),
        // body: const Center(child: Text('Recipes For The Selected Category!')));
        body: ListView.builder(
            itemBuilder: (context, index) => MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration),
            itemCount: categoryMeals.length));
  }
}
