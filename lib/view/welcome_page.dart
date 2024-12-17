import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
         children: [
          Container(
            decoration : BoxDecoration(
              image : DecorationImage(
                image:AssetImage(
                 'image\photo1final.jpg'),
                fit:BoxFit.cover,
              ),
            ),
          ),
          Text('touks',)
         ]
      ), 
    );
  }
}