import 'package:delivery_app/view/main_page.dart';
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
          WelcomePage(),
      // Products(
      //   id: 1,
      // ),
    );
  }
}
