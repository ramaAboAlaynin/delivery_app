class Product {
  final String image;
  final String name;
  final int quantity;
  final String describtion;

  Product(
      {required this.image,
      required this.describtion,
      required this.name,
      required this.quantity});

  static List<Product> fromjson(List<Map<String, dynamic>> products) {
    return products
        .map(
          (e) => Product(
            image: e['image'],
            describtion: e['describtion'],
            name: e['name'],
            quantity: e['quantity'],
          ),
        )
        .toList();
  }
}
