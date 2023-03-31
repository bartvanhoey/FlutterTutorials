import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  bool showOnlyFavorites;

  ProductsGrid({
    required this.showOnlyFavorites,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final products = showOnlyFavorites
        ? productsProvider.favoriteItems
        : productsProvider.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: products[i], child: const ProductItem()),
        itemCount: products.length);
  }
}
