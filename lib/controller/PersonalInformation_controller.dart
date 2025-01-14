import 'dart:io';
import 'package:delivery_app/view/main_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:delivery_app/view/stores.dart';
import '../services/PersonalInformationApi.dart';

class PersonalInformationController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var location = ''.obs;
  var image = Rx<File?>(null);
  final _picker = ImagePicker();
  final ProfileService profileService = ProfileService();

  // Function to pick an image
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  // API call to update profile (now calls the service)
  Future<void> updateProfile() async {
    if (image.value != null) {
      bool success = await profileService.updateProfile(
        firstName.value,
        lastName.value,
        location.value,
        image.value!,
      );
      if (success) {
        Get.to(MainPage()); // Navigate to the stores screen if successful
      } else {
        print("Profile update failed.");
      }
    } else {
      print("No image selected.");
    }
  }
}
