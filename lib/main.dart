import 'package:delivery_app/view/personal_information.dart';
//import 'package:delivery_app/view/stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: personal_information(),
    );
  }
}
