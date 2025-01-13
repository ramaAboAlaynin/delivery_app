// فئة Product لتخزين بيانات المنتج
class ProductOrder {
  String productName;
  int quantity;
  double price;

  ProductOrder({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}


// فئة Order لتخزين بيانات الطلب
class Order {
  String orderId;
  String orderStatus;
  bool isConfirmed;
  List<ProductOrder> products;

  Order({
    required this.orderId,
    required this.orderStatus,
    this.isConfirmed = false,
    required this.products,
  });

  double get totalPrice {
    double total = 0;
    for (var product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }
}

class OrderModel {
  final int orderId;
  final String totalPrice;
  final int? userId;
  final int? driverId;
  final String orderStatus;
  final String createdAt;
  final String updatedAt;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    this.userId,
    this.driverId,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['id'],
      totalPrice: json['total_price'],
      userId: json['user_id'],
      driverId: json['driver_id'],
      orderStatus: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

