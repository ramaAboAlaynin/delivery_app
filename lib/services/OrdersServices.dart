import 'dart:convert';
import 'package:delivery_app/core/config.dart';
import 'package:http/http.dart' as http;
import '../model/OrderModel.dart';

class OrderService {
  final String apiUrl = '${Config.baseUrl}/api/orders';

  Future<List<OrderModel>> fetchOrders() async {
    try {
      final response = await http.get(Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer ${Config.token.toString()}'});

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((order) => OrderModel.fromJson(order)).toList();
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
