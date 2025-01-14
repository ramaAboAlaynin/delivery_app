import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/OrderDetailesModel.dart';
import '../controller/OrderDetailsController.dart';

class OrderDetailsPage extends StatelessWidget {
  final int orderId;
  final String status;
  final String totalPrice;

  OrderDetailsPage({required this.orderId, required this.status, required this.totalPrice, });

  @override
  Widget build(BuildContext context) {
    final OrderDetailsController orderController = Get.put(OrderDetailsController());

    orderController.fetchOrderDetails(orderId);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Obx(
            () {
          if (orderController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (orderController.order.value == null) {
            return Center(child: Text('No order details available.'));
          }

          OrderModelDetails order = orderController.order.value!;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Order Information
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Order ID: $orderId',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Status: $status',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Total Price: \$$totalPrice',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Products Section
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.pink[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Products:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),

                // Display Product Details
                Expanded(
                  child: ListView.builder(
                    itemCount: order.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                               order.products[index].product_name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Quantity: ${order.products[index].quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Price: \$${order.products[index].price * order.products[index].quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[700],
                  ),
                  child: Text(
                    'Back to Order Page',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
