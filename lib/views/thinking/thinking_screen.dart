import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/views/result/result_page.dart';
import 'package:sistem_pakar_skincare/models/consultationResult.dart';
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

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (){
        Get.off(
          ()=> ResultPage(
            result: widget.result,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/UISI.png",
                  height: 170,
                ),
                const SizedBox(height: 40),
                const LoadingCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}