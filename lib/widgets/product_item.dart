import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final void Function(Product) onAddProduct;

  const ProductItem(
      {super.key, required this.product, required this.onAddProduct});

  static const snackBar = SnackBar(
    content: Text('Added to cart!'),
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: const Icon(Icons.shopping_cart),
      onTap: () {
        onAddProduct(product);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
