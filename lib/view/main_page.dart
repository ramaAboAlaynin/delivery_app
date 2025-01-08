import 'package:delivery_app/view/homa_page.dart';
import 'package:delivery_app/view/shoppingCartPage.dart';
import 'package:delivery_app/view/stores.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 241, 195, 211),
          title: const Text('Delivery App'),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.store), text: "Stores"),
            Tab(icon: Icon(Icons.person), text: "Profile"),
            Tab(icon: Icon(Icons.shopping_cart), text: "Shoppingcart"),
          ],
        ),
        body: TabBarView(
          children: [
            HomaPage(),
            Stores(),
            Center(child: Text("Profile Page")),
            Shoppingcartpage(),
          ],
        ),
      ),
    );
  }
}
