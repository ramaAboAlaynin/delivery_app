class Shoppingcart {
  final int id;
  final String name;
  final double price;
  int quantity;
  final int storeId;
  final double totalPrice;

  Shoppingcart({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.storeId,
    required this.totalPrice,
  });

  static List<Shoppingcart> fromjson(List shoppingCart) {
    return shoppingCart
        .map((e) => Shoppingcart(
              id: e['product_id'],
              name: e['product_name'],
              price: e['price'].toDouble(),
              storeId: e['store_id'],
              quantity: e['quantity'],
              totalPrice: e['total_price'].toDouble(),
            ))
        .toList();
  }
}
