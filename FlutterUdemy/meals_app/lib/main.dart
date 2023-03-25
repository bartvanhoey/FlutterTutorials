import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false
  };

  List<Meal> _filteredMeals = dummyMeals;

  void setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _filteredMeals = dummyMeals.where((meal) {
        if ((_filters['isGlutenFree'] ?? false) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters['islactoseFree'] ?? false) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['isVegan'] ?? false) && !meal.isVegan) {
          return false;
        }
        if ((_filters['isVegetarian'] ?? false) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodySmall:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleMedium: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold))),
        routes: {
          '/': (context) => const TabsScreen(),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(_filteredMeals),
          MealDetailScreen.routeName: (context) => const MealDetailScreen(),
          FiltersScreen.routeName: (context) => FiltersScreen(setFilters, _filters),
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
              builder: (context) => const CategoriesScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (context) => const CategoriesScreen());
        });
  }
}
