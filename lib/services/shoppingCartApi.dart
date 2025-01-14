import 'package:delivery_app/core/config.dart';
import 'package:delivery_app/model/shoppingCart.dart';
import 'package:dio/dio.dart';

class Shoppingcartapi {
  static Future<List<Shoppingcart>> fetchShoppingCart() async {
    final response = await Dio().get(
      "${Config.baseUrl}/api/cart/get",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${Config.token.toString()}',
        },
      ),
    );
    print(response);
    return Shoppingcart.fromjson(response.data['cart_items']);
  }

  static Future addToCart(int id, int quantity) async {
    await Dio().post(
      "${Config.baseUrl}/api/cart/add",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${Config.token.toString()}',
        },
      ),
      data: {
        'product_id': id,
        'quantity': quantity,
      },
    );
  }

  static Future updateCart(int id, int quantity) async {
    await Dio().post("${Config.baseUrl}/api/cart/updatecart",
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Config.token.toString()}',
          },
        ),
        data: {
          'product_id': id,
          'quantity': quantity,
        });
  }

  static Future removeProduct(int id) async {
    await Dio().post(
      "${Config.baseUrl}/api/cart/removeproduct",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${Config.token.toString()}',
        },
      ),
      data: {
        'product_id': id,
      },
    );
  }
}
