import 'dart:convert';
import 'package:delivery_app/core/config.dart';
import 'package:http/http.dart' as http;
import '../model/OrderDetailesModel.dart';

class OrderService {
  String Url = "${Config.baseUrl}/api/orders/getProductsFromOrder";

  Future<OrderModelDetails> getOrderDetails(int orderId) async {
    final response = await http.post(
      Uri.parse(Url),
      headers: {
        'Authorization': 'Bearer ${Config.token.toString()}'
      },
    body: {
      'order_id': orderId.toString()
    }

    );

    if (response.statusCode == 200) {
      print(response.body);
      return OrderModelDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load order details');
    }
  }
}
