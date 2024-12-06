class Store {
  final int id;
  final String name;
  final String image;

  Store({required this.id, required this.name, required this.image});

  static List<Store> fromjson(List<Map<String, dynamic>> stores) {
    return stores
        .map(
          (e) => Store(id: e['id'], name: e['name'], image: e['image']),
        )
        .toList();
  }
}

final List<Map<String, dynamic>> storesMap = [
  {'id': 1, 'name': 'makeup store', 'image': 'assets/images/store.jpg'},
  {'id': 2, 'name': 'sportswear store', 'image': 'assets/images/sport.jpg'},
  {'id': 3, 'name': 'shoes store', 'image': 'assets/images/shoes.jpg'},
  {'id': 4, 'name': 'clothes store', 'image': 'assets/images/shopping.jpg'},
  {'id': 5, 'name': 'food store', 'image': 'assets/images/food.jpg'},
  {'id': 6, 'name': 'accessory store', 'image': 'assets/images/accessory.jpg'},
  {'id': 7, 'name': 'mobile store', 'image': 'assets/images/mobile.jpg'},
  {
    'id': 8,
    'name': 'mobile accessories store',
    'image': 'assets/images/mobile accessories.jpg'
  },
  {'id': 9, 'name': 'laptop store', 'image': 'assets/images/laptop.jpg'},
  {'id': 10, 'name': 'cleaner store', 'image': 'assets/images/cleaner.jpg'},
];
