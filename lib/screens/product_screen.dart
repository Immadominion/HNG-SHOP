import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: 'p1', title: 'Airpods pro', price: 29.99),
    Product(id: 'p2', title: 'Samsung 24 Ultra', price: 599.99),
    Product(id: 'p3', title: 'HNG Scholarship', price: 299.99),
    Product(id: 'p4', title: 'Winter deal Drones', price: 199.99),
    Product(id: 'p5', title: 'NFT NG', price: 99.99),
  ];

  final void Function(Product) onAddProduct;

  ProductsScreen({super.key, required this.onAddProduct});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(
        product: products[index],
        onAddProduct: onAddProduct,
      ),
    );
  }
}
