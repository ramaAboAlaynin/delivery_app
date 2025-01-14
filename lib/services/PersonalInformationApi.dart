import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:delivery_app/core/config.dart';

class ProfileService {
  Future<bool> updateProfile(String firstName, String lastName, String location, File image) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Config.token.toString()}'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('${Config.baseUrl}/api/update-profile'));

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
        return true;
      } else {
        print('Error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
