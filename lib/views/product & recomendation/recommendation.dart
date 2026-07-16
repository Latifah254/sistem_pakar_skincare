import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/controller/product_controller.dart';
import 'package:sistem_pakar_skincare/models/produkSkincare.dart';
import 'package:sistem_pakar_skincare/views/product%20&%20recomendation/product.dart';
import 'widgets/skincare_card.dart';

class RecommendationPage extends StatefulWidget {

  final List<SkincareProduct> products;

  const RecommendationPage({
    super.key,
    required this.products,
  });

  @override
  State<RecommendationPage> createState() =>
      _RecommendationPageState();
}

class _RecommendationPageState
    extends State<RecommendationPage> {

  final ProductController controller =
      Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    controller.loadProducts(widget.products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rekomendasi Produk",
        ),
      ),

      body: Obx(
        ()=>ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount:
              controller.products.length,
          itemBuilder: (_, index){
            final product =
                controller.products[index];
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 15),
              child: SkincareCard(
                product: product,
                onTap: (){
                  Get.to(
                    ()=>ProductDetailPage(
                          product: product,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}