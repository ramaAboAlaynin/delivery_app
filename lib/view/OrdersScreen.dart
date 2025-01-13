import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'OrderDetailsPage.dart';
import '../model/OrderModel.dart';
import '../controller/OrdersController.dart';

class OrdersScreen extends StatelessWidget {
  final OrderController controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Order Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.orders.isEmpty) {
                  return Center(child: Text('No orders available'));
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                       await controller.fetchOrders();
                    },
                    child: ListView.builder(
                      itemCount: controller.orders.length,
                      itemBuilder: (context, index) {
                        final order = controller.orders[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Order ID: ${order.orderId}'),
                                  SizedBox(height: 4),
                                  Text(
                                    'Total: \$${order.totalPrice}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text('Status: ${order.orderStatus}'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderDetailsPage(orderId: order.orderId, status: order.orderStatus, totalPrice: order.totalPrice, ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
