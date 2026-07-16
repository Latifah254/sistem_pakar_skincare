import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/models/consultationResult.dart';
import 'package:sistem_pakar_skincare/views/result/widgets/action_button_section.dart';
import 'package:sistem_pakar_skincare/views/result/widgets/diagnosis_card.dart';
import 'package:sistem_pakar_skincare/views/result/widgets/product_card.dart';
import 'package:sistem_pakar_skincare/widgets/primary_button.dart';
import 'package:sistem_pakar_skincare/widgets/secondary_button.dart';
import 'package:sistem_pakar_skincare/widgets/custom_card.dart';
import 'package:sistem_pakar_skincare/widgets/section_title.dart';
import 'package:sistem_pakar_skincare/views/home/home.dart';

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
        title: const Text("Hasil Konsultasi"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              DiagnosisCard(
                title: "Jenis Kulit",
                value: result.skinType.name,
                icon: Icons.face,
              ),

              const SizedBox(height: 20),

              DiagnosisCard(
                title: "Masalah Kulit",
                value: result.skinProblem.name,
                icon: Icons.healing,
              ),

              const SizedBox(height: 30),

              const SectionTitle(
                title: "Rekomendasi Produk",
              ),

              const SizedBox(height: 15),

              ...result.products.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductCard(
                    product: e,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const ActionButtonSection(),

            ],
          ),
        ),
      ),
    );
  }
}

//Improve Result Screen UI