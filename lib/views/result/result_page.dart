import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/models/consultationResult.dart';
import 'package:sistem_pakar_skincare/views/product & recomendation/recommendation.dart';

import 'widgets/diagnosis_card.dart';
import 'widgets/match_card.dart';
import 'widgets/explanation_card.dart';

class ResultPage extends StatelessWidget {
  final ConsultationResult result;

  const ResultPage({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: const Color(0xffF8FAFC),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Hasil Analisis",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
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

        //child: SafeArea(

          child: SingleChildScrollView(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                DiagnosisCard(

                  title: "Jenis Kulit",

                  value: result.skinType.name,

                  icon: Icons.face_retouching_natural,

                  backgroundColor:
                      const Color(0xffEEF9F1),

                  iconBackground:
                      const Color(0xffD6F3DE),

                ),

                const SizedBox(height: 18),

                DiagnosisCard(

                  title: "Masalah Kulit",

                  value: result.skinProblem.name,

                  icon: Icons.healing,

                  backgroundColor:
                      const Color(0xffFFF1F1),

                  iconBackground:
                      const Color(0xffFFDADA),

                ),

                const SizedBox(height: 18),

                const MatchCard(
                  percentage: 0.92,
                ),

                const SizedBox(height: 22),

                ExplanationCard(

                  skinType:
                      result.skinType.name,

                  skinProblem:
                      result.skinProblem.name,

                ),

                const SizedBox(height: 28),
                                SizedBox(

                  width: double.infinity,

                  height: 58,

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

                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                    ),

                    label: const Text(

                      "Lihat Rekomendasi Produk",

                      style: TextStyle(

                        fontSize: 17,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    onPressed: () {

                      Get.to(

                        () => RecommendationPage(

                          products: result.products,

                        ),

                      );

                    },

                  ),

                ),

                const SizedBox(height: 20),

              ],

            ),

          ),

        //),

      ),

    );

  }

}