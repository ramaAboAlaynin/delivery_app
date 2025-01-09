import 'package:delivery_app/core/config.dart';
import 'package:delivery_app/model/product.dart';
import 'package:dio/dio.dart';

class Productapi {
  static Future<List<Product>> fetchProducts(storeId) async {
    final response = await Dio().get("${Config.baseUrl}/api/product/$storeId");
    return Product.fromjson(response.data['data']);
  }
}
