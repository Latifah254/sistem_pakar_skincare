import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/models/consultationResult.dart';
import 'package:sistem_pakar_skincare/views/result/result_page.dart';
import 'widgets/loading_card.dart';

class ThinkingScreen extends StatefulWidget {
  final ConsultationResult result;

  const ThinkingScreen({
    super.key,
    required this.result,
  });

  @override
  State<ThinkingScreen> createState() =>
      _ThinkingScreenState();
}

class _ThinkingScreenState
    extends State<ThinkingScreen> {

  /// dimulai dari -1 agar progress = 0%
  int currentStep = -1;

  Timer? timer;

  final List<String> processText = [

    "Memulai analisis...",

    "Mengidentifikasi jenis kulit...",

    "Mengidentifikasi masalah kulit...",

    "Mencocokkan knowledge base...",

    "Menentukan rekomendasi skincare...",

  ];

  @override
  void initState() {
    super.initState();
    _startThinking();
  }

  void _startThinking() {

    timer = Timer.periodic(

      const Duration(milliseconds: 900),

      (t) {

        if (!mounted) return;

        if (currentStep < 3) {

          setState(() {
            currentStep++;
          });

        } else {

          timer?.cancel();

          Future.delayed(

            const Duration(milliseconds: 700),

            () {

              if (!mounted) return;

              Get.off(

                () => ResultPage(
                  result: widget.result,
                ),

              );

            },

          );

        }

      },

    );

  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

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

          child: Center(

            child: Padding(

              padding: const EdgeInsets.all(22),

              child: LoadingCard(

                currentStep: currentStep,

                statusText:
                    processText[currentStep + 1],

              ),

            ),

          ),

        ),

      ),

    );

  }

}