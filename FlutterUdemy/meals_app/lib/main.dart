import 'package:flutter/material.dart';
import 'package:meals_app/Category_meals_screen.dart';
import 'package:meals_app/categories_screen.dart';

import './Category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleMedium: const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)
        )
        
      ),
      // home: const CategoriesScreen(),
      routes: {
        '/' : (context) => const CategoriesScreen(), 
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(), 
      },
    );
  }
}

