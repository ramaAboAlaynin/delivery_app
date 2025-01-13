// import 'package:flutter/material.dart';
//
// import '../DriverOrders/DriverOrdersPage.dart';
//
// class DriverSignInPage extends StatefulWidget {
//   @override
//   _DriverSignInPageState createState() => _DriverSignInPageState();
// }
//
// class _DriverSignInPageState extends State<DriverSignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   // قائمة تحتوي على الأزواج من أرقام الهواتف وكلمات المرور الثابتة
//   final Map<String, String> validCredentials = {
//     '+96391111111': 'password123',
//     '+96392222222': 'driver2024',
//     '+96393333333': 'secure1234',
//     '+96394444444': 'passkey456',
//     '+96395555555': 'welcome789',
//   };
//
//   void signin(String phone, String password) {
//     // إضافة مفتاح الدولة +963 إذا لم يكن موجوداً
//     if (!phone.startsWith('+963')) {
//       phone = '+963' + phone;
//     }
//
//     // التحقق من أن رقم الهاتف وكلمة المرور المدخلة متطابقان
//     if (validCredentials.containsKey(phone)) {
//       if (validCredentials[phone] == password) {
//         // إذا كانت المدخلات صحيحة، انتقل إلى صفحة "طلباتي"
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DriverOrdersPage(
//             orders: [],
//             onOrderRemoved: (index) {},
//           )),
//         );
//       } else {
//         // إذا كانت كلمة المرور غير صحيحة
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('The password does not match the phone number!')),
//         );
//       }
//     } else {
//       // إذا كان الرقم غير موجود في القائمة
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Phone number does not exist!')),
//       );
//     }
//   }
//
//   Future signin(String phone, String pass)async
//   {
//     String fullPhoneNumber = '+963' + phone;
//     var response = await http.post(
//         Uri.parse('${Config.baseUrl}/api/login'),
//         body: <String,String>
//         {
//           'phone': fullPhoneNumber,
//           'password': pass,
//         },
//         headers: {
//           'lang': 'ar',
//         }
//     );
//     print(fullPhoneNumber);
//     print(pass);
//
//
//     if(response.statusCode==200)
//     {
//       var js = jsonDecode(response.body);
//       print(response.statusCode);
//       print(response.headers);
//       print(response.body);
//
//       String token = js['data']['original']['access_token'];
//       Config.token = token;
//       print('the token is $token');
//       // إذا كانت المدخلات صحيحة، انتقل إلى صفحة المتجر
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Stores()),
//       );
//
//     }
//     else
//     {
//       print('حدث خطأ في التسجيل، الرجاء المحاولة لاحقاً.');
//       print(response.statusCode);
//       print(response.headers);
//       print(response.body);
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: Text(
//           'Sign In Driver',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//           ),
//         ),
//         backgroundColor: Colors.pinkAccent,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Enter your phone number",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.pinkAccent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _mobileController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     labelText: 'Phone Number',
//                     prefixText: '+963',
//                     labelStyle: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.pinkAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.pinkAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.pinkAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     errorStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Your Phone';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Enter your password",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.pinkAccent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,  // إخفاء النص داخل الحقل
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.pinkAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.pinkAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.pinkAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     errorStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.pinkAccent,
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(vertical: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'Back',
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.pinkAccent,
//                   padding: EdgeInsets.symmetric(vertical: 20),
//                 ),
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     signin(
//                       _mobileController.text,
//                       _passwordController.text,
//                     );
//                   }
//                 },
//                 child: Text(
//                   'Sign In',
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../DriverOrders/DriverOrdersPage.dart';
import '../core/config.dart';

class DriverSignInPage extends StatefulWidget {
  @override
  _DriverSignInPageState createState() => _DriverSignInPageState();
}

class _DriverSignInPageState extends State<DriverSignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> validCredentials = {
    '+96391111111': 'password123',
    '+96392222222': 'driver2024',
    '+96393333333': 'secure1234',
    '+96394444444': 'passkey456',
    '+96395555555': 'welcome789',
  };

  Future<void> signinWithApi(String phone, String password) async {
    String fullPhoneNumber = phone.startsWith('+963') ? phone : '+963$phone';

    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/api/login'),
        body: {'phone': fullPhoneNumber, 'password': password},
        headers: {'lang': 'ar'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final token = jsonResponse['data']['original']['access_token'];
        Config.token = token;

        // Navigate to the next page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverOrdersPage(
              orders: [], // Pass appropriate orders data if needed
              onOrderRemoved: (index) {},
            ),
          ),
        );
      } else {
        showErrorSnackbar('Invalid credentials or server error. Please try again.');
      }
    } catch (e) {
      showErrorSnackbar('Failed to connect to the server. Please try again later.');
    }
  }

  void signin() {
    String phone = _mobileController.text.trim();
    String password = _passwordController.text.trim();

    if (!phone.startsWith('+963')) {
      phone = '+963$phone';
    }

    // Validate against static credentials first
    if (validCredentials.containsKey(phone)) {
      if (validCredentials[phone] == password) {
        // If valid, proceed to API login
        signinWithApi(phone, password);
      } else {
        showErrorSnackbar('The password does not match the phone number!');
      }
    } else {
      showErrorSnackbar('Phone number does not exist in the allowed list!');
    }
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Sign In Driver',
          style: TextStyle(color: Colors.white, fontSize: 24),
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
                    "Enter your phone number",
                    style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixText: '+963',
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your password",
                    style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
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
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text('Back', style: TextStyle(fontSize: 24)),
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
                    signin();
                  }
                },
                child: Text('Sign In', style: TextStyle(fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
