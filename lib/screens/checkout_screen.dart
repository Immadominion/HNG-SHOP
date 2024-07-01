import 'package:flutter/material.dart';
import '../models/product.dart';
import 'order_successful_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Product> checkoutProducts;
  final void Function(Product) onRemoveProduct;
  final VoidCallback onOrderSuccess;

  const CheckoutScreen({
    super.key,
    required this.checkoutProducts,
    required this.onRemoveProduct,
    required this.onOrderSuccess,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isShowingLoadingDialog = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.checkoutProducts.isEmpty
            ? const Expanded(
                child: Center(
                    child: Text(
                  "Nothing here :(",
                  textAlign: TextAlign.center,
                )),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: widget.checkoutProducts.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(widget.checkoutProducts[index].title),
                    leading: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => widget
                          .onRemoveProduct(widget.checkoutProducts[index]),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.payment_rounded),
                      onPressed: () async {
                        if (!_isShowingLoadingDialog) {
                          setState(() {
                            _isShowingLoadingDialog = true;
                          });

                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          );

                          await Future.delayed(const Duration(seconds: 2));

                          widget
                              .onRemoveProduct(widget.checkoutProducts[index]);

                          Navigator.pop(context);
                          setState(() {
                            _isShowingLoadingDialog = false;
                          });
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const OrderSuccessfulScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
