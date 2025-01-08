import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // String imageUrl = 'https://example.com/product.jpg';
  String productName = 'Product Name';
  double productPrice = 49.99;
  int selectedQuantity = 0;
  int productQuantity = 10;
  String productDescription = 'This is a detailed description of the product.';

  Color _iconColor = Colors.black;

  void _changeColor() {
    setState(() {
      _iconColor = _iconColor == Colors.black ? Colors.red : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 195, 211),
        title: Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              print("object");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Image.network(imageUrl),
              SizedBox(height: 300.0),
              Text(
                productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('\$$productPrice'),
              SizedBox(height: 8.0),
              Text('Available: $productQuantity pieces'),
              SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: _iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _changeColor();
                      });
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (selectedQuantity > 0) {
                          selectedQuantity--;
                          productQuantity++;
                        }
                      });
                    },
                  ),
                  Text('$selectedQuantity'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        if (selectedQuantity < productQuantity) {
                          selectedQuantity++;
                          productQuantity--;
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(productDescription),
            ],
          ),
        ),
      ),
    );
  }
}
