// CartScreen.dart
import 'package:flutter/material.dart';
import 'package:tutorial1/screens/product_list_page_widget.dart';

class CartPage extends StatelessWidget {
  final List<Product> cartItems;
  final double subTotal;

  const CartPage(
      {super.key, required this.cartItems, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cart")),
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("RM ${item.price.toStringAsFixed(2)}")
                  );
                },
              ),
            ),
            Text("Subtotal: RM ${subTotal.toStringAsFixed(2)}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go back"))
          ],
        ));
  }
}
