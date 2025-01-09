class Shoppingcart {
  final int id;
  final String name;
  final double price;
  int quantity;

  Shoppingcart({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
