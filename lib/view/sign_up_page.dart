import 'package:delivery_app/core/config.dart';
import 'package:delivery_app/view/PersonalInformation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  Future signup(String phone, String pass, String confirmPass) async {
    if (pass != confirmPass) {
      print('كلمة المرور غير متطابقة');
      return;
    }
    String fullPhoneNumber = '+963' + phone;

    var response = await http.post(Uri.parse('${Config.baseUrl}/api/register'),
        body: <String, String>{
          'phone': fullPhoneNumber,
          'password': pass,
          'password_confirmation':
              confirmPass, // قد تحتاج إلى إضافة هذا الحقل إذا كان موجوداً في الـ API
        },
        headers: {
          'Accept': 'application/json'
        });
    print(fullPhoneNumber);
    print(pass);
    print(confirmPass);

    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);

      print(response.statusCode);
      print(response.headers);
      print(response.body);

      String token = js['data']['original']['access_token'];
      print('تم التسجيل بنجاح، التوكن هو: $token');
      // إذا كانت المدخلات صحيحة، انتقل إلى صفحة الشخصية
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PersonalInformation()),
      );
    } else {
      print('حدث خطأ في التسجيل، الرجاء المحاولة لاحقاً.');
      print(response.statusCode);
      print(response.headers);
      print(response.body);
    }
  }

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // دالة التحقق من قوة كلمة المرور
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }
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

    return null;
  }

  // دالة التحقق من تطابق كلمة المرور مع تأكيد كلمة المرور
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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
            'Sign Up Page',
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
                    obscureText: true, // إخفاء النص داخل الحقل
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    validator: _validatePassword, // التحقق من كلمة المرور
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm your password",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true, // إخفاء النص داخل الحقل
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
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
                    validator:
                        _validateConfirmPassword, // التحقق من تطابق كلمة المرور
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
                      signup(
                        _mobileController.text,
                        _passwordController.text,
                        _confirmPasswordController.text,
                      );
                      print('touka albaali');
                    }
                  },
                  child: Text(
                    'Sign Up',
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
