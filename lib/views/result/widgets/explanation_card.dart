import 'package:flutter/material.dart';

class ExplanationCard extends StatelessWidget {

  final String skinType;
  final String skinProblem;
  final double confidence;
  final String status;

  const ExplanationCard({
    super.key,
    required this.skinType,
    required this.skinProblem,
    required this.confidence,
    required this.status,
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

        crossAxisAlignment:
            CrossAxisAlignment.start,

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

          Container(

            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(

              color: const Color(0xffEEF9F1),

              borderRadius:
                  BorderRadius.circular(16),

            ),

            child: Row(

              children: [

                const Icon(
                  Icons.analytics_outlined,
                  color: Color(0xff2E8B57),
                ),

                const SizedBox(width: 12),

                Expanded(

                  child: Text(

                    "Tingkat analisis: ${confidence.toStringAsFixed(0)}% ($status)",

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E8B57),
                    ),

                  ),

                ),

              ],

            ),

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
                      "SkinSense AI menganalisis jawaban konsultasi menggunakan metode ",

                ),

                const TextSpan(

                  text: "Forward Chaining",

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2E8B57),
                  ),

                ),

                const TextSpan(

                  text:
                      " dan menemukan bahwa kondisi kulit paling sesuai dengan kategori ",

                ),

                TextSpan(

                  text: skinType,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2E8B57),
                  ),

                ),

                const TextSpan(
                  text: " dengan permasalahan utama ",
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
                      ". Persentase kecocokan diperoleh dari proses pencocokan gejala yang kamu pilih terhadap basis pengetahuan sistem pakar. Semakin tinggi persentasenya, semakin kuat tingkat keyakinan sistem terhadap hasil diagnosis.",

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }
}