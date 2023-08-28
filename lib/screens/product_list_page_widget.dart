import 'package:flutter/material.dart';
import 'package:tutorial1/screens/cart_page_widget.dart';

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

class ProductListPageWidget extends StatefulWidget {
  const ProductListPageWidget({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPageWidget> {
  List<Product> products = [
    Product(id: 1, name: "Product A", price: 10.00),
    Product(id: 2, name: "Product B", price: 20.00),
    Product(id: 3, name: "Product C", price: 30.00),
    Product(id: 4, name: "Product D", price: 40.00),
    // Add more products here...
  ];
  List<Product> cartItems = [];

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void removeAll() {
    setState(() {
      cartItems.clear();
    });
  }

  double calculateSubtotal() {
    double subtotal = 0.0;
    for (var item in cartItems) {
      subtotal += item.price;
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product List")),
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text("\RM ${product.price.toStringAsFixed(2)}"),
                    trailing: ElevatedButton(
                      onPressed: () => addToCart(product),
                      child: const Text("Add to Cart"),
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text("Total item: ${cartItems.length}")),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                    child: const Text("Calculate"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CartPage(
                            cartItems: cartItems,
                            subTotal: calculateSubtotal());
                      }));
                    })),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                    child: const Text("Reset"),
                    onPressed: () {
                      removeAll();
                    }))
          ],
        ));
  }
}
