class Product {
  final String image;
  final String name;
  final int quantity;
  final String description;
  final String price;

  Product(
      {required this.image,
      required this.description,
      required this.name,
      required this.quantity,
      required this.price});

  static List<Product> fromjson(List products) {
    return products
        .map(
          (e) => Product(
            image: e['image'],
            description: e['description'],
            name: e['name'],
            quantity: e['quantity'],
            price: e['price'],
          ),
        )
        .toList();
  }
}
