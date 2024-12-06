// import 'package:delivery_app/model/product.dart';
import 'package:delivery_app/model/product.dart';
import 'package:delivery_app/widget/productitem.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final int id;
  const Products({
    super.key,
    required this.id,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // late List<Product> products;
  final Map<dynamic, List<Product>> products = {
    1: Product.fromjson(productsMap),
    2: Product.fromjson(productsMap2),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 195, 211),
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3.2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: products[widget.id]?.length ?? 0,
          itemBuilder: (context, index) {
            final product = products[widget.id]![index];
            return ProductItem(product: product);
          },
        ),
      ),
    );
  }
}
