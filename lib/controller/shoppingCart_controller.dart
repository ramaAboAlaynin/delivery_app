import 'package:delivery_app/model/shoppingCart.dart';
import 'package:get/get.dart';

class ShoppingcartController extends GetxController {
  var cartItems = <Shoppingcart>[].obs;
  var totalPrice = 0.0.obs;

  void addToCart(Shoppingcart item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != -1) {
      cartItems[index].quantity += item.quantity;
    } else {
      cartItems.add(item);
    }
    updateTotalPrice();
  }

  void increaseQuantity(Shoppingcart item) {
    item.quantity++;
    cartItems.refresh();
    updateTotalPrice();
  }

  void decreaseQuantity(Shoppingcart item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      removeFromCart(item);
    }
    cartItems.refresh();
    updateTotalPrice();
  }

  void removeFromCart(Shoppingcart item) {
    cartItems.remove(item);
    updateTotalPrice();
  }

  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0.0;
  }

  void updateTotalPrice() {
    totalPrice.value =
        cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}
