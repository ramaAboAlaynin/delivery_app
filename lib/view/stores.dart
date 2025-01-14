import 'package:delivery_app/controller/store_controller.dart';
import 'package:delivery_app/widget/storeitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/store.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  late StoreController controller;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    controller = Get.put(StoreController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Stores',
                labelStyle: TextStyle(color: Colors.grey),
                hintText: 'Enter store name',
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
              child: Obx(
                () {
                  List<Store> filteredProducts = controller.stores;
                  if (searchQuery.isNotEmpty) {
                    filteredProducts = controller.stores
                        .where((store) => store.name
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) => StoreItem(
                      store: filteredProducts[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
