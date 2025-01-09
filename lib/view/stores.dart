import 'package:delivery_app/controller/store_controller.dart';
import 'package:delivery_app/widget/storeitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  late StoreController controller;

  @override
  void initState() {
    controller = Get.put(StoreController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Obx(
        () {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2.7,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: controller.stores.length,
            itemBuilder: (context, index) => StoreItem(
              store: controller.stores[index],
            ),
          );
        },
      ),
    );
  }
}
