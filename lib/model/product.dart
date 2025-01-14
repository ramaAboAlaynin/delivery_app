class Product {
  final int id;
  final String image;
  final String name;
  final int quantity;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.image,
    required this.description,
    required this.name,
    required this.quantity,
    required this.price,
  });

  static List<Product> fromjson(List products) {
    return products
        .map(
          (e) => Product(
            id: e['id'],
            image: e['URL_image'],
            description: e['description'],
            name: e['name'],
            quantity: e['quantity'],
            price: e['price'].toDouble(),
          ),
        )
        .toList();
  }
}
