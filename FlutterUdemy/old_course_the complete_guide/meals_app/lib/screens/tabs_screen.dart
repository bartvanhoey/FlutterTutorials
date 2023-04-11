import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.category),
                label: _pages[0]['title'] as String),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.star),
                label: _pages[1]['title'] as String),
          ]),
    );

    //   return DefaultTabController(
    //       length: 2,
    //       initialIndex: 1,
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: const Text('Meals'),
    //           bottom: const TabBar(tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Categories',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favorites',
    //             )
    //           ]),
    //         ),
    //         body: const TabBarView(children: [CategoriesScreen(), FavoritesScreen() ]),
    //       ));
  }
}
