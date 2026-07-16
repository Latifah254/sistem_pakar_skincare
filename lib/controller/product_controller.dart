import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ProductController extends GetxController {

  final RxList<SkincareProduct> products =
      <SkincareProduct>[].obs;

  void loadProducts(List<SkincareProduct> data) {
    products.assignAll(data);
  }

}