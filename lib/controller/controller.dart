import 'package:get/get.dart';
import 'package:shopping_mall_grid_view/model/product.dart';
import 'package:shopping_mall_grid_view/data/services.dart';

class Controller extends GetxController {
  static Controller get to => Get.find<Controller>();
  var isLoading = false.obs;
  var productList = <Product>[].obs;
  var productsInCartList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
    isLoading.value = false;
  }

  void addToCart(Product product){
    productsInCartList.add(product);
    print(productsInCartList.length);
  }
}
