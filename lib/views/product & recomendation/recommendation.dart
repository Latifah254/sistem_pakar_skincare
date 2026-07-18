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

  final List<String> categories = [
    "Semua",
    "Cleanser",
    "Toner",
    "Serum",
    "Moisturizer",
    "Sunscreen",
  ];

  String selectedCategory = "Semua";

  @override
  void initState() {
    super.initState();
    controller.loadProducts(widget.products);
  }

  List<SkincareProduct> get filteredProducts {

    if (selectedCategory == "Semua") {
      return controller.products;
    }

    return controller.products.where((item) {

      return item.brand
          .toLowerCase()
          .contains(
            selectedCategory.toLowerCase(),
          );

    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,

        centerTitle: false,

        title: const Text(
          "Rekomendasi Produk",
          style: TextStyle(
            color: Color(0xff1F2937),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(

        children: [

  const SizedBox(height: 10),
                    /// =========================
          /// CATEGORY CHIP
          /// =========================

          SizedBox(
            height: 45,

            child: ListView.separated(

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              scrollDirection: Axis.horizontal,

              itemCount: categories.length,

              separatorBuilder: (_, __) =>
                  const SizedBox(width: 10),

              itemBuilder: (context, index) {

                final category = categories[index];

                final isSelected =
                    selectedCategory == category;

                return GestureDetector(

                  onTap: () {

                    setState(() {

                      selectedCategory = category;

                    });

                  },

                  child: AnimatedContainer(

                    duration:
                        const Duration(milliseconds: 250),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),

                    decoration: BoxDecoration(

                      color: isSelected
                          ? const Color(0xff2E8B57)
                          : Colors.white,

                      borderRadius:
                          BorderRadius.circular(25),

                      boxShadow: [

                        BoxShadow(

                          color: Colors.black.withOpacity(.05),

                          blurRadius: 10,

                          offset: const Offset(0, 4),

                        ),

                      ],

                    ),

                    alignment: Alignment.center,

                    child: Text(

                      category,

                      style: TextStyle(

                        fontWeight: FontWeight.w600,

                        color: isSelected
                            ? Colors.white
                            : Colors.black87,

                      ),

                    ),

                  ),

                );

              },

            ),

          ),

          const SizedBox(height: 20),

          /// =========================
          /// LIST PRODUK
          /// =========================

          Expanded(

            child: Obx(

              () => ListView.builder(

                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                itemCount: filteredProducts.length,

                itemBuilder: (context, index) {

                  final product =
                      filteredProducts[index];

                  return Padding(

                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),

                    child: SkincareCard(

                      product: product,

                      onTap: () {

                        Get.to(

                          () => ProductDetailPage(
                            product: product,
                          ),

                        );

                      },

                    ),

                  );

                },

              ),

            ),

          ),

        ],

      ),

    );

  }

}
