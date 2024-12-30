import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/model/store.dart';
import 'package:delivery_app/view/stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final adminFirstNameController = TextEditingController();
  final adminLastNameController = TextEditingController();
  final adminLocationController = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchUserProfile().then((profileData) {
      setState(() {
        adminFirstNameController.text = profileData['first_name'];
        adminLastNameController.text = profileData['last_name'];
        adminLocationController.text = profileData['location'];
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: Text(
          "Your Personal Information...",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 255, 128, 171),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 80),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80,
                child: GestureDetector(
                  onTap: pickImage,
                  child: Icon(Icons.camera_alt),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: adminFirstNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  prefix: Icon(Icons.near_me),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: adminLastNameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  prefix: Icon(Icons.near_me),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: adminLocationController,
                decoration: InputDecoration(
                  labelText: "Location",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                elevation: 0.5,
                color: Color.fromARGB(255, 255, 128, 171),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                  profile(
                    adminFirstNameController.text,
                    adminLastNameController.text,
                    adminLocationController.text,
                    _image!,
                  );
                  Get.to(Stores());
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future profile(
      String firstName, String lastName, String location, File image) async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.43.7:8000/api/userInformation/4'));
    request.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
      'location': location,
    });
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  // تابع GET لجلب البيانات من API
  Future<Map<String, dynamic>> fetchUserProfile() async {
    final response = await http
        .get(Uri.parse('http://192.168.43.7:8000/api/userInformation/4'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
