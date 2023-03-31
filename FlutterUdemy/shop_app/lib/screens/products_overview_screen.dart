import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/products_provider.dart';

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
              icon: Icon(Icons.more_vert),
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
                    onPressed: () => {}, icon: const Icon(Icons.shopping_cart)))
          ],
        ),
        body: ProductsGrid(showOnlyFavorites: _showFavoritesOnly));
  }
}
