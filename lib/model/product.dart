class Product {
  final String image;
  final String name;
  final int quantity;
  final String description;

  Product(
      {required this.image,
      required this.description,
      required this.name,
      required this.quantity});

  static List<Product> fromjson(List products) {
    return products
        .map(
          (e) => Product(
            image: e['URL_image'],
            description: e['description'],
            name: e['name'],
            quantity: e['quantity'],
          ),
        )
        .toList();
  }
}
