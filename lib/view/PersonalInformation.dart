import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/PersonalInformation_controller.dart';

class PersonalInformation extends StatelessWidget {
  final PersonalInformationController controller = Get.put(PersonalInformationController());

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
              Obx(() => CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 80,
                child: GestureDetector(
                  onTap: controller.pickImage,
                  child: controller.image.value == null
                      ? Icon(Icons.camera_alt, size: 50)
                      : ClipOval(
                          child: Image.file(
                            controller.image.value!, // Display the selected image
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          ),
                        ),
                ),
              )),
              SizedBox(height: 30),
              Obx(() => TextField(
                controller: TextEditingController(text: controller.firstName.value),
                onChanged: (value) {
                  controller.firstName.value = value;
                },
                decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
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
              )),
              SizedBox(height: 30),
              Obx(() => TextField(
                controller: TextEditingController(text: controller.lastName.value),
                onChanged: (value) {
                  controller.lastName.value = value;
                },
                decoration: InputDecoration(
                  labelText: "Last Name",
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
              )),
              SizedBox(height: 30),
              Obx(() => TextField(
                controller: TextEditingController(text: controller.location.value),
                onChanged: (value) {
                  controller.location.value = value;
                },
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
              )),
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
                  controller.updateProfile();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
