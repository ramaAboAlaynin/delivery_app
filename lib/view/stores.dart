import 'package:delivery_app/controller/store_controller.dart';
import 'package:delivery_app/view/OrdersScreen.dart';
import 'package:delivery_app/widget/storeitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/store.dart';
import 'welcome_page.dart';

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
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(
              255, 238, 238, 238), // Background color of the Drawer
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              // My Orders Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 255, 128, 171), // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5, // Button shadow
                ),
                child: Text(
                  "My Orders",
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18,
                    fontWeight: FontWeight.bold, // Font weight
                  ),
                ),
                onPressed: () {
                  Get.to(OrdersScreen()); // Navigate to OrdersScreen
                },
              ),
              SizedBox(height: 20), // Space between buttons
              // My Cart Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  "My Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  // Add action for My Cart here
                },
              ),
              SizedBox(height: 20),
              // Log Out Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Get.to(WelcomePage());
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 195, 211),
        title: const Text(
          "Stores",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
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
