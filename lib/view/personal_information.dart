//  ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:delivery_app/model/store.dart';
import 'package:delivery_app/view/stores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class personal_information extends StatelessWidget {
  // const personal_information({super.key});

  @override
  personal_information creatState() => personal_information();

  File? _image;
  final _picker = ImagePicker();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: Text(
          " Your Personal Information...",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),

              CircleAvatar(
                backgroundColor: null,
                radius: 80,
                child: GestureDetector(
                  onTap: pickImage,
                  child: Icon(Icons.camera_alt),
                ),
              ),
              //.................

              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: " First Name",
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
                  disabledBorder: OutlineInputBorder(
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
              //......................
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: " Last Name",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  prefix: Icon(Icons.near_me),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
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
              //........................
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "    Location ",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 128, 171),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
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
                    ),
                  ),
                ),
              ),
              //________________________________________________________________
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                elevation: 0.5,
                color: Color.fromARGB(255, 255, 128, 171),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 50,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(Stores());
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker pickImage = ImagePicker();
    var xFile = await pickImage.pickImage(source: ImageSource.gallery);
    _image = File(xFile!.path);
  }
}
