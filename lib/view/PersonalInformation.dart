import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/core/config.dart';
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

  get js => null;

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
                  child: _image == null
                      ? Icon(Icons.camera_alt,
                          size: 50) // Show camera icon if no image is selected
                      : ClipOval(
                          child: Image.file(
                            _image!, // Display the selected image
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: adminFirstNameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  // prefix: Icon(Icons.access_time_filled_sharp),
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
                  //  prefix: Icon(Icons.near_me),
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
                  if (_image != null) {
                    profile(
                      adminFirstNameController.text,
                      adminLastNameController.text,
                      adminLocationController.text,
                      _image!,
                    );
                    Get.to(Stores());
                  } else {
                    // Handle the case when no image is selected
                    print("No image selected.");
                  }
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
        _image = File(pickedFile
            .path); // Update the _image variable with the picked image
      }
    });
  }

  Future profile(
      String firstName, String lastName, String location, File image) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Config.token.toString()}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Config.baseUrl}/api/update-profile'));
    print("Name${firstName}");
    print("Name${lastName}");
    print("Name${location}");
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
      // print response
      print(response.statusCode);

      print(response.stream.bytesToString());
      String token = js['data']['original']['access_token'];
      print('the token is $token');
      // only if success go to home page
      Get.to(Stores());
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
      print(response.stream.bytesToString());
    }
  }
}
