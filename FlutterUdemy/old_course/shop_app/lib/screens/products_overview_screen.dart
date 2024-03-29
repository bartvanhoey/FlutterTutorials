import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/products_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/my_badge.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  _showFavoritesOnly =
                      (selectedValue == FilterOptions.favorites) ? true : false;
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                    value: FilterOptions.favorites,
                    child: Text('Only Favorites')),
                const PopupMenuItem(
                    value: FilterOptions.all, child: Text('Show All'))
              ],
            ),
            Consumer<CartProvider>(
                builder: (_, cart, ch) => MyBadge(
                      value: cart.itemCount.toString(),
                      child: ch as Widget,
                    ),
                child: IconButton(
                    onPressed: () =>
                        {Navigator.of(context).pushNamed(CartScreen.routeName)},
                    icon: const Icon(Icons.shopping_cart)))
          ],
        ),
        drawer: const AppDrawer(),
        body: ProductsGrid(showOnlyFavorites: _showFavoritesOnly));
  }
}
