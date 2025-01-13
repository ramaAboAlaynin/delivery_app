import 'package:delivery_app/controller/shoppingCart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shoppingcartpage extends StatefulWidget {
  const Shoppingcartpage({super.key});

  @override
  State<Shoppingcartpage> createState() => _ShoppingcartpageState();
}

class _ShoppingcartpageState extends State<Shoppingcartpage> {
  late ShoppingcartController controller;

  @override
  void initState() {
    controller = Get.find<ShoppingcartController>();
    controller.fetchshoppingCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (controller.cartItems.isEmpty) {
                  return const Center(
                    child: Text("Your cart is empty"),
                  );
                }
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                            "Price: \$${item.price.toStringAsFixed(2)} x ${item.quantity}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => controller.decreaseQuantity(
                                  item.id, item.quantity - 1),
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text(
                              "${item.quantity}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () => controller.increaseQuantity(
                                  item.id, item.quantity + 1),
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.removeFromCart(item.id),
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return Text(
                    "Total: \$${controller.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                //  ElevatedButton(
                // onPressed: () => Get.to(() => ),
                // child: const Text("Buy"),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
