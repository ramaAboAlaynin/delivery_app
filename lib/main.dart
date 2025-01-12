import 'package:delivery_app/view/homa_page.dart';
import 'package:delivery_app/view/products.dart';
import 'package:delivery_app/view/shoppingCartPage.dart';
import 'package:delivery_app/view/stores.dart';
import 'package:delivery_app/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // ProductDetailScreen()
          Shoppingcartpage(),
      //     Products(
      //   id: 1,
      // ),
    );
  }
}
