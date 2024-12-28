import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  Future signin(String phone, String pass)async
  {
    String fullPhoneNumber = '+963' + phone;
    var response = await http.post(
        Uri.parse('http://192.168.153.1:8000/api/login'),
        body: <String,String>
        {
          'phone': fullPhoneNumber,
          'password': pass,
        },
        headers: {
          'lang': 'ar',
        }
    );
    print(fullPhoneNumber);
    print(pass);


    if(response.statusCode==200)
    {
      var js = jsonDecode(response.body);
      print(response.statusCode);
      print(response.headers);
      print(response.body);

      String token = js['data']['original']['access_token'];
      print('the token is $token');
      // إذا كانت المدخلات صحيحة، انتقل إلى صفحة المتجر
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StorePage()),
      );
      */
    }
    else
    {
      print('حدث خطأ في التسجيل، الرجاء المحاولة لاحقاً.');
      print(response.statusCode);
      print(response.headers);
      print(response.body);
    }
  }

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // دالة التحقق من قوة كلمة المرور
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // تحقق من أن طول كلمة المرور أكبر من أو يساوي 8 محارف
    if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }
    // تحقق من وجود أحرف كبيرة وصغيرة وأرقام ورموز
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp numbers = RegExp(r'[0-9]');
    RegExp specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!lowerCase.hasMatch(value)) {
      return 'Password should contain at least one lowercase letter';
    }
    if (!upperCase.hasMatch(value)) {
      return 'Password should contain at least one uppercase letter';
    }
    if (!numbers.hasMatch(value)) {
      return 'Password should contain at least one number';
    }
    if (!specialChars.hasMatch(value)) {
      return 'Password should contain at least one special character';
    }

    return null; // كلمة المرور صحيحة
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your number",
                      style: TextStyle(
                          fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixText: '+963',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Phone';
                      }
                      if (value.length != 8) {
                        return 'It should start with +963 and contain 8 digits.';
                      }
                      if (value[0] != '9') {
                        return 'The first digit after +963 should be 9.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your password",
                      style: TextStyle(
                          fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,  // إخفاء النص داخل الحقل
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                        ),
                      ),
                      errorStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    validator: _validatePassword, // التحقق من كلمة المرور
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      signin(
                        _mobileController.text,
                        _passwordController.text,
                      );

                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
