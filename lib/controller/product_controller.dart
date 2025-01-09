import 'package:delivery_app/model/product.dart';
import 'package:delivery_app/services/productApi.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  late int storeId;

  ProductController(this.storeId);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      products.value = await Productapi.fetchProducts(storeId);
      print("this is controller page");
      print(products.first);
    } catch (e) {
      print("this is controller page fail");
      print(e);
    }
  }
}
