import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/models/consultationResult.dart';

class ResultPage extends StatelessWidget {
  final ConsultationResult result;

  const ResultPage({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Konsultasi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jenis Kulit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(result.skinType.name),
            const SizedBox(height: 20),
            const Text(
              "Masalah Kulit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(result.skinProblem.name),
            const SizedBox(height: 20),
            const Text(
              "Rekomendasi Produk",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: result.products.length,
                itemBuilder: (context, index) {
                  final product = result.products[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.spa),
                      title: Text(product.name),
                      subtitle: Text(product.brand),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Konsultasi Ulang"),
              ),
            )
          ],
        ),
      ),
    );
  }
}