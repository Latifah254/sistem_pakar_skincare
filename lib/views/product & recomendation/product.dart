import 'package:flutter/material.dart';

import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ProductDetailPage extends StatelessWidget {
  final SkincareProduct product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                height:220,
              ),
            ),

            const SizedBox(height:25),
            Text(
              product.name,
              style: const TextStyle(
                fontSize:24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:5),
            Chip(
              label: Text(product.brand),
            ),

            const SizedBox(height:25),

            const Text(
              "Kandungan Utama",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:18,
              ),
            ),

            const SizedBox(height:10),
            Text(product.ingredient),

            const SizedBox(height:25),

            const Text(
              "Manfaat",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:18,
              ),
            ),

            const SizedBox(height:10),
            Text(product.description),

            const SizedBox(height:25),

            const Text(
              "Cara Penggunaan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:18,
              ),
            ),

            const SizedBox(height:10),
            Text(product.usage),

            const SizedBox(height:35),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },

                child: const Text(
                  "Kembali",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}