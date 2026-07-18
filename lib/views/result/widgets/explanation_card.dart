import 'package:flutter/material.dart';

class ExplanationCard extends StatelessWidget {
  final String skinType;
  final String skinProblem;

  const ExplanationCard({
    super.key,
    required this.skinType,
    required this.skinProblem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(22),

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

          const Row(
            children: [

              Icon(
                Icons.auto_awesome,
                color: Color(0xff2E8B57),
                size: 22,
              ),

              SizedBox(width: 8),

              Text(
                "Penjelasan AI",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          const SizedBox(height: 18),

          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                height: 1.7,
              ),
              children: [

                const TextSpan(
                  text:
                      "Berdasarkan gejala yang telah kamu jawab, sistem berhasil mengidentifikasi bahwa kondisi kulitmu termasuk kategori ",
                ),

                TextSpan(
                  text: skinType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2E8B57),
                  ),
                ),

                const TextSpan(
                  text: " dengan permasalahan utama berupa ",
                ),

                TextSpan(
                  text: skinProblem,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),

                const TextSpan(
                  text:
                      ".\nRekomendasi produk berikut dipilih khusus agar sesuai dengan kondisi kulitmu.",
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}