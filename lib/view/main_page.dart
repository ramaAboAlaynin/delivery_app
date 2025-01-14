import 'package:delivery_app/controller/shoppingCart_controller.dart';
import 'package:delivery_app/core/config.dart';
import 'package:delivery_app/view/OrdersScreen.dart';
import 'package:delivery_app/view/homa_page.dart';
import 'package:delivery_app/view/shoppingCartPage.dart';
import 'package:delivery_app/view/stores.dart';
import 'package:delivery_app/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ShoppingcartController controller;

  @override
  void initState() {
    controller = Get.put(ShoppingcartController());
    super.initState();
  }

  Future<void> logout() async {
    String url = "${Config.baseUrl}/api/logout";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${Config.token.toString()}',
        },
      );

      if (response.statusCode == 200) {
        print('Logout successful');
        // Navigate to the WelcomePage
        Get.to(WelcomePage());
      } else {
        print('Failed to log out: ${response.body}');
      }
    } catch (error) {
      print('Error during logout: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 241, 195, 211),
          title: const Text('Delivery App'),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                          logout();
                        },
                        child: Text('logout'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.store), text: "Stores"),
            Tab(icon: Icon(Icons.shopping_cart), text: "Cart"),
            Tab(icon: Icon(Icons.grading_outlined), text: "Orders"),
          ],
        ),
        body: TabBarView(
          children: [
            HomaPage(),
            Stores(),
            Shoppingcartpage(),
            OrdersScreen(),
          ],
        ),
      ),
    );
  }
}
