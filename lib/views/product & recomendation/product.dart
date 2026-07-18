import 'package:flutter/material.dart';

import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ProductDetailPage extends StatelessWidget {
  final SkincareProduct product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(

        backgroundColor: Colors.white,

        surfaceTintColor: Colors.white,

        elevation: 0,

        centerTitle: true,

        title: const Text(

          "Detail Produk",

          style: TextStyle(

            color: Colors.black,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

      body: Container(

        width: double.infinity,

        height: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,

            colors: [

              Color(0xffEAF7EC),

              Colors.white,

            ],

          ),

        ),

        child: SafeArea(

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                              Center(
                child: Hero(
                  tag: product.code,
                  child: Container(
                    width: 220,
                    height: 220,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffDDF4E3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  product.brand,
                  style: const TextStyle(
                    color: Color(0xff2E8B57),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                product.description,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 28),

                            _buildInfoCard(
                title: "Kandungan Utama",
                icon: Icons.science_outlined,
                content: product.ingredient,
                iconColor: const Color(0xff2E8B57),
              ),

              const SizedBox(height: 18),

              _buildInfoCard(
                title: "Manfaat",
                icon: Icons.favorite_border_rounded,
                content: product.description,
                iconColor: Colors.redAccent,
              ),

              const SizedBox(height: 18),

              _buildInfoCard(
                title: "Cara Penggunaan",
                icon: Icons.menu_book_outlined,
                content: product.usage,
                iconColor: Colors.orange,
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 56,

                child: ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                        const Color(0xff2E8B57),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(

                      borderRadius:
                          BorderRadius.circular(18),

                    ),

                  ),

                  icon: const Icon(Icons.arrow_back),

                  label: const Text(

                    "Kembali",

                    style: TextStyle(

                      fontSize: 17,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  onPressed: () {

                    Navigator.pop(context);

                  },

                ),

              ),

                          ],
          ),
        ),
      ),
      )
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Icon(
                icon,
                color: iconColor,
                size: 22,
              ),

              const SizedBox(width: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}