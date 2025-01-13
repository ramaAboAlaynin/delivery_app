import 'package:get/get.dart';

import '../model/OrderDetailesModel.dart';
import '../services/OrderDetailsServices.dart';


class OrderDetailsController extends GetxController {
  var isLoading = false.obs;
  var order = Rxn<OrderModelDetails>();

  final OrderService orderService = OrderService();

  Future<void> fetchOrderDetails(int orderId) async {
    try {
      isLoading.value = true;
      OrderModelDetails fetchedOrder = await orderService.getOrderDetails(orderId);
      order.value = fetchedOrder;
    } catch (e) {
      print('Error fetching order: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
