import 'package:delivery_app/model/shoppingCart.dart';
import 'package:delivery_app/services/OrdersServices.dart';
import 'package:delivery_app/services/shoppingCartApi.dart';
import 'package:delivery_app/view/OrdersScreen.dart';
import 'package:get/get.dart';

class ShoppingcartController extends GetxController {
  var cartItems = <Shoppingcart>[].obs;

  double get totalPrice => cartItems.fold(
        0.0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  @override
  void onInit() {
    fetchshoppingCart();
    super.onInit();
  }

  fetchshoppingCart() async {
    cartItems.value = await Shoppingcartapi.fetchShoppingCart();
  }

  void addToCart(int id, int quantity) async {
    try {
      await Shoppingcartapi.addToCart(id, quantity);
      fetchshoppingCart();
    } catch (e) {
      print(e);
    }
  }

  void increaseQuantity(int id, int quantity) async {
    try {
      await Shoppingcartapi.updateCart(id, quantity);
      fetchshoppingCart();
    } catch (e) {
      print(e);
    }
  }

  void decreaseQuantity(int id, int quantity) async {
    try {
      await Shoppingcartapi.updateCart(id, quantity);
      fetchshoppingCart();
    } catch (e) {
      print(e);
    }
  }

  void removeFromCart(int id) async {
    try {
      await Shoppingcartapi.removeProduct(id);
    } catch (e) {
      print(e);
    }

    fetchshoppingCart();
  }

  void clearCart() {
    cartItems.clear();
  }

  void createOrder() async {
    try {
      await OrderService().createOrder();
      Get.to(OrdersScreen());
    } catch (e) {
      print(e);
    }
  }
}
