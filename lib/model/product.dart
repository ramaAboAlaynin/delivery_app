class Product {
  final String image;

  Product({required this.image});

  static List<Product> fromjson(List<Map<String, dynamic>> products) {
    return products.map((e) => Product(image: e['image'])).toList();
  }
}

final productsMap = [
  {'image': 'assets/images/p1.jpg'},
  {'image': 'assets/images/p2.jpg'},
  {'image': 'assets/images/p3.jpg'},
  {'image': 'assets/images/p4.jpg'},
  {'image': 'assets/images/p5.jpg'},
  {'image': 'assets/images/p6.jpg'},
  {'image': 'assets/images/p7.jpg'},
  {'image': 'assets/images/p8.jpg'},
  {'image': 'assets/images/p9.jpg'},
  {'image': 'assets/images/p10.jpg'},
  {'image': 'assets/images/p11.jpg'},
  {'image': 'assets/images/p12.jpg'},
  {'image': 'assets/images/p13.jpg'},
  {'image': 'assets/images/p14.jpg'},
  {'image': 'assets/images/p15.jpg'},
  {'image': 'assets/images/p16.jpg'},
  {'image': 'assets/images/p17.jpg'},
  {'image': 'assets/images/p18.jpg'},
  {'image': 'assets/images/p19.jpg'},
  {'image': 'assets/images/p20.jpg'},
  {'image': 'assets/images/p21.jpg'},
  {'image': 'assets/images/p22.jpg'},
  {'image': 'assets/images/p23.jpg'},
  {'image': 'assets/images/p24.jpg'},
  {'image': 'assets/images/p25.jpg'},
  {'image': 'assets/images/p26.jpg'},
  {'image': 'assets/images/p27.jpg'},
];

final productsMap2 = [
  {'image': 'assets/images/s1.jpg'},
  {'image': 'assets/images/s2.jpg'},
  {'image': 'assets/images/s3.jpg'},
  {'image': 'assets/images/s4.jpg'},
  {'image': 'assets/images/s5.jpg'},
  {'image': 'assets/images/s6.jpg'},
  {'image': 'assets/images/s7.jpg'},
  {'image': 'assets/images/s8.jpg'},
  {'image': 'assets/images/s9.jpg'},
  {'image': 'assets/images/s10.jpg'},
  {'image': 'assets/images/s11.jpg'},
  {'image': 'assets/images/s12.jpg'},
  {'image': 'assets/images/s13.jpg'},
  {'image': 'assets/images/s14.jpg'},
  {'image': 'assets/images/s15.jpg'},
];
