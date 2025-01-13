import 'package:flutter/material.dart';

import '../model/OrderModel.dart';

class DriverOrdersPage extends StatelessWidget {
  final List<Order> orders;
  final Function onOrderRemoved;

  DriverOrdersPage({required this.orders, required this.onOrderRemoved});

  // تغيير الحالة للطلب المحدد
  void updateOrderStatus(BuildContext context, int index, String newStatus) {
    orders[index].orderStatus = newStatus;
    (context as Element).markNeedsBuild(); // تحديث واجهة المستخدم
  }

  // وظيفة لحذف الطلب
  void removeOrder(int index) {
    onOrderRemoved(index); // إعلام الواجهة الرئيسية بحذف الطلب
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Driver Request',
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
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
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
                        title: Text('Order ID: ${orders[index].orderId}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Status: ${orders[index].orderStatus}'),
                            SizedBox(height: 4),
                            Text(
                              'Total: \$${orders[index].totalPrice}',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (status) {
                            updateOrderStatus(context, index, status);
                          },
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Accepted',
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.pink[100],
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                  child: Text(
                                    'Accept Order',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'On the Way',
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.pink[100],
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                  child: Text(
                                    'On the Way',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Arrived',
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.pink[100],
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                  child: Text(
                                    'Arrived',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Delivered',
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.pink[100],
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                  child: Text(
                                    'Delivered',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
