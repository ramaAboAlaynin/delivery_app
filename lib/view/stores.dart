import 'package:delivery_app/model/store.dart';
import 'package:delivery_app/widget/storeitem.dart';
import 'package:flutter/material.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  late List<Store> stores;
  @override
  void initState() {
    stores = Store.fromjson(storesMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: stores.length,
          itemBuilder: (context, index) => StoreItem(
            store: stores[index],
          ),
        ),
      ),
    );
  }
}
