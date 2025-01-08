// import 'package:delivery_app/model/product.dart';
import 'package:delivery_app/controller/product_controller.dart';
import 'package:delivery_app/model/CustomSearch.dart';
import 'package:delivery_app/widget/productitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  late ProductController controller;
  @override
  void initState() {
    controller = Get.put(ProductController(widget.id));
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Customsearch());
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3.2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return ProductItem(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}
