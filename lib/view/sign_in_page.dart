
import 'package:delivery_app/view/sign_in_driver.dart';
import 'package:delivery_app/view/sign_in_user.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          children: [
            Container(
              decoration : BoxDecoration(
                image : DecorationImage(
                  image:AssetImage(
                      'lib/image/photo1final.jpg'),
                  fit:BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:Text('Hello',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child:Text('\nAre you a user or a driver?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInUser()),
                        );
                      },
                      child: Text(
                        'Sign in user ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pinkAccent,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DriverSignInPage()),
                        );
                      },
                      child: Text(
                        'Sign in driver',
                        style: TextStyle(
                          color: Colors.pinkAccent[400],
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}