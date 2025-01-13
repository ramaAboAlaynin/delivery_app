import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_app/controller/shoppingCart_controller.dart';
import 'package:delivery_app/model/shoppingCart.dart';
import 'package:delivery_app/view/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  final List<String> imgList = [
    'assets/images/998969.jpeg',
    'assets/images/download1.png',
    'assets/images/Screenshot-2022-09-24-130636.png',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: imgList.map((item) {
                  return Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      _current = entry.key;
                    }),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == entry.key ? Colors.blue : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                "Stores",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildStore(
                      context,
                      id: 1,
                      name: "Store 1",
                      imageAssetPath: "assets/images/cleaner.jpg",
                    ),
                    buildStore(
                      context,
                      id: 2,
                      name: "Store 2",
                      imageAssetPath: "assets/images/store.jpg",
                    ),
                    buildStore(
                      context,
                      id: 3,
                      name: "Store 3",
                      imageAssetPath: "assets/images/shopping.jpg",
                    ),
                    buildStore(
                      context,
                      id: 3,
                      name: "Store 4",
                      imageAssetPath: "assets/images/shopping.jpg",
                    ),
                    buildStore(
                      context,
                      id: 3,
                      name: "Store 5",
                      imageAssetPath: "assets/images/shopping.jpg",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Offers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildProduct(
                      context,
                      id: 1,
                      name: "product 1",
                      imageAssetPath: "assets/images/p5.jpg",
                    ),
                    buildProduct(
                      context,
                      id: 2,
                      name: "product 2",
                      imageAssetPath: "assets/images/p4.jpg",
                    ),
                    buildProduct(
                      context,
                      id: 3,
                      name: "product 3",
                      imageAssetPath: "assets/images/p3.jpg",
                    ),
                    buildProduct(
                      context,
                      id: 3,
                      name: "product 4",
                      imageAssetPath: "assets/images/p2.jpg",
                    ),
                    buildProduct(
                      context,
                      id: 3,
                      name: "product 5",
                      imageAssetPath: "assets/images/p1.jpg",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStore(
    BuildContext context, {
    required int id,
    required String name,
    required String imageAssetPath,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => Products(id: id));
        },
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          child: Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageAssetPath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200]!.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildProduct(
  BuildContext context, {
  required int id,
  required String name,
  required String imageAssetPath,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: Container(
        width: 120,
        height: 180, // Increased height for button space
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageAssetPath,
                width: double.infinity,
                height: 120, // Adjusted height for image
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 40, // Adjusted position for title
              left: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200]!.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  Get.find<ShoppingcartController>().addToCart(id, 1);
                  Get.snackbar(
                    "Added to Cart",
                    "$name has been added to your cart.",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 2),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
