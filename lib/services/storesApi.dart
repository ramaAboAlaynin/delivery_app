import 'package:delivery_app/core/config.dart';
import 'package:delivery_app/model/store.dart';
import 'package:dio/dio.dart';

class Storesapi {
  static Future<List<Store>> fetchStores() async {
    final response = await Dio().get("${Config.baseUrl}/api/stores");
print(response.data);
    return Store.fromjson(response.data['data']);
  }
}
