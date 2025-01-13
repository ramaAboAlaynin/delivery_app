import 'package:delivery_app/model/product.dart';
import 'package:flutter/material.dart';

import '../core/config.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({
    super.key,
    required this.product,
  });
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState(this.product);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // String imageUrl = 'https://example.com/product.jpg';
  //String productName = 'Product Name';
  //double productPrice = 49.99;
  int selectedQuantity = 0;
  late int productQuantity;
  //String productDescription = 'This is a detailed description of the product.';

  Color _iconColor = Colors.black;

  final Product product;
  _ProductDetailScreenState(this.product);

  void _changeColor() {
    setState(() {
      _iconColor = _iconColor == Colors.black ? Colors.red : Colors.black;
    });
  }

  @override
  void initState() {
    super.initState();
    productQuantity = product.quantity;
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
              //SizedBox(height: 300.0),
              SizedBox(
          height: 300.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${Config.baseUrl}${product.image}',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('\$${product.price}'),
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
                          print(productQuantity);
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
                        if (productQuantity > 0) {
                          print(productQuantity);
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
              Text(product.description),
            ],
          ),
        ),
      ),
    );
  }
}
