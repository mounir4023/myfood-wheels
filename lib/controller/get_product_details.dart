import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/service/get_product_service.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  List<ProductModel> listProduct = <ProductModel>[].obs;
  List<ProductModel> cardProductModel = <ProductModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    try {
      await GetProductService().getProduct().then((product) {
        listProduct.addAll(product);
      });
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
