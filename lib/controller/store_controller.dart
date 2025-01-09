import 'package:delivery_app/model/store.dart';
import 'package:delivery_app/services/storesApi.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  var stores = <Store>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchStores();
    super.onInit();
  }

  fetchStores() async {
    try {
      print(11);
      stores.value = await Storesapi.fetchStores();
      print(2);
    } catch (e) {
      print(e);
    }
  }
}
