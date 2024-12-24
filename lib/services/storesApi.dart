import 'package:delivery_app/model/store.dart';
import 'package:dio/dio.dart';

class Storesapi {
  static Future<List<Store>> fetchStores() async {
    final response = await Dio().get("http://192.168.8.100:8000/api/stores");

    return Store.fromjson(response.data['data']);
  }
}
