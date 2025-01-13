//
// class ProductModel {
//   final int id;
//   final int productId;
//   final int quantity;
//   final int orderId;
//   final double price;
//   final String createdAt;
//   final String updatedAt;
//
//   ProductModel({
//     required this.id,
//     required this.productId,
//     required this.quantity,
//     required this.orderId,
//     required this.price,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'],
//       productId: json['product_id'],
//       quantity: json['quantity'],
//       orderId: json['order_id'],
//       price: double.parse(json['price']),
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }


class ProductModel {
  final String product_name;
  final int quantity;
  final double price;

  ProductModel({
    required this.product_name,
    required this.quantity,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      product_name: json['product_name'],
      quantity: json['quantity'],
      price: double.parse(json['price']),
    );
  }
}

// order_details_model.dart
class OrderModelDetails {
  final List<ProductModel> products;

  OrderModelDetails({
    required this.products,
  });

  factory OrderModelDetails.fromJson(List<dynamic> json) {
    List<ProductModel> productsList = json
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();

    return OrderModelDetails(
      products: productsList,
    );
  }
}
