class Store {
  final int id;
  final String name;
  final String image;
  //final String createdAt;
  //final String location;

  Store({
    required this.id,
    required this.name,
    required this.image,
    // required this.createdAt,
    // required this.location,
  });

  static List<Store> fromjson(List stores) {
    return stores
        .map(
          (e) => Store(
            id: e['id'],
            name: e['name'],
            image: e['URL_image'],
            // createdAt: e['created_at'],
            //location: e['location'],
          ),
        )
        .toList();
  }
}
