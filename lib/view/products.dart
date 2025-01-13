// // import 'package:delivery_app/model/product.dart';
// import 'package:delivery_app/controller/product_controller.dart';
// import 'package:delivery_app/model/product.dart';
// import 'package:delivery_app/widget/productitem.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Products extends StatefulWidget {
//   final int id;
//   const Products({
//     super.key,
//     required this.id,
//   });
//
//   @override
//   State<Products> createState() => _ProductsState();
// }
//
// class _ProductsState extends State<Products> {
//   late ProductController controller;
//   TextEditingController searchController = TextEditingController();
//   String searchQuery = '';
//
//   @override
//   void initState() {
//     controller = Get.put(ProductController(widget.id));
//     super.initState();
//   }
//
//   void _onSearchChanged() {
//     setState(() {
//       searchQuery = searchController.text;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 241, 195, 211),
//           title: Text(
//             "Products",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextFormField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   labelText: 'Search Products',
//                   labelStyle: TextStyle(color: Colors.grey),
//                   hintText: 'Enter product name',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Obx(
//
//                   () {
//
//                     List<Product> filteredProducts = controller.products;
//
//                     // Filter the products based on the search query
//                     if (searchQuery.isNotEmpty) {
//                       filteredProducts = controller.products
//                           .where((product) => product.name
//                           .toLowerCase()
//                           .contains(searchQuery.toLowerCase()))
//                           .toList();
//                     }
//                     return GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithMaxCrossAxisExtent(
//                         maxCrossAxisExtent: 200,
//                         childAspectRatio: 2 / 3.2,
//                         crossAxisSpacing: 20,
//                         mainAxisSpacing: 20,
//                       ),
//                       itemCount: filteredProducts.length,
//                       itemBuilder: (context, index) {
//                         final product = filteredProducts[index];
//                         return ProductItem(product: product);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
//
import 'package:delivery_app/controller/product_controller.dart';
import 'package:delivery_app/model/product.dart';
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
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

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
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;  // Update the search query
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search Products',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter product name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() {
                  List<Product> filteredProducts = controller.products;
                  if (searchQuery.isNotEmpty) {
                    filteredProducts = controller.products
                        .where((product) => product.name
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()))
                        .toList();
                  }

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductItem(product: product);
                    },
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
