import 'package:flutter/material.dart';
import './screens/product_screen.dart';
import './screens/checkout_screen.dart';
import './screens/order_successful_screen.dart';
import './models/product.dart';

void main() {
  runApp(const HNGShoppingApp());
}

class HNGShoppingApp extends StatefulWidget {
  const HNGShoppingApp({super.key});

  @override
  HNGShoppingAppState createState() => HNGShoppingAppState();
}

class HNGShoppingAppState extends State<HNGShoppingApp> {
  final List<Product> _checkoutProducts = [];
  int _selectedIndex = 0;

  void _addProduct(Product product) {
    setState(() {
      _checkoutProducts.add(product);
    });
  }

  void _removeProduct(Product product) {
    setState(() {
      _checkoutProducts.remove(product);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('HNG SHOP')),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            ProductsScreen(onAddProduct: _addProduct),
            CheckoutScreen(
              checkoutProducts: _checkoutProducts,
              onRemoveProduct: _removeProduct,
              onOrderSuccess: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderSuccessfulScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Checkout'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
