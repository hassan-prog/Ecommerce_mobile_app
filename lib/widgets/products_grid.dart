import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteProducts;

  ProductsGrid(this.showFavoriteProducts);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        showFavoriteProducts ? productData.favoriteItems : productData.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: ((ctx, i) => ChangeNotifierProvider.value(
            //using .value here is recommended when using existing object
            // create: (c) => products[i],

            value: products[i],
            child: ProductItem(
                // id: products[i].id,
                // title: products[i].title,
                // imageUrl: products[i].imageUrl,
                ),
          )),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
