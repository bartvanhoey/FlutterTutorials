import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> filters;

  const FiltersScreen(this.setFilters, this.filters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['isGlutenFree'] ?? false;
    _isVegetarian = widget.filters['isVegetarian'] ?? false;
    _isVegan = widget.filters['isVegan'] ?? false;
    _isLactoseFree = widget.filters['isLactoseFree'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
      bool switchValue, String title, String subTitle, Function updateHandler) {
    return SwitchListTile(
        title: Text(title),
        value: switchValue,
        subtitle: Text(subTitle),
        onChanged: (value) => updateHandler(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  var filters = {
                    'isGlutenFree': _isGlutenFree,
                    'isLactoseFree': _isLactoseFree,
                    'isVegan': _isVegan,
                    'isVegetarian': _isVegetarian
                  };
                  widget.setFilters(filters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleMedium)),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(_isGlutenFree, 'Gluten-free',
                  'Only include gluten-free meals.', (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _buildSwitchListTile(_isLactoseFree, 'Lactose-free',
                  'Only include lactose-free meals.', (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  _isVegetarian, 'Vegetarian', 'Only include vegetarian meals.',
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _buildSwitchListTile(
                  _isVegan, 'Vegan', 'Only include vegan meals.', (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              })
            ],
          ))
        ]));
  }
}
