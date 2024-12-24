import 'package:delivery_app/model/product.dart';
import 'package:dio/dio.dart';

class Productapi {
  static Future<List<Product>> fetchProducts(storeId) async {
    final response =
        await Dio().get("http://192.168.8.100:8000/api/product/$storeId");
    return Product.fromjson(response.data['data']);
  }
}
