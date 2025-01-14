import 'package:get/get.dart';
import '../model/OrderModel.dart';
import '../services/OrdersServices.dart';

class OrderController extends GetxController {
  var isLoading = true.obs;
  var orders = <OrderModel>[].obs;
  final OrderService orderService = OrderService();

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);
      List<OrderModel> orderList = await orderService.fetchOrders();
      orders.assignAll(orderList);
    } catch (e) {
      print('Error fetching orders: $e');
    } finally {
      isLoading(false);
    }
  }
}
