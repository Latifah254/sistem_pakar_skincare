import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/views/chatbot%20&%20result/chatbot_screen.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xff5DB075),
            Color(0xff2E8B57),
          ],
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "AI Skincare Expert",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 10),
          const Text(
            "Kenali kondisi kulitmu\nhanya dalam beberapa menit.",
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor:
                  const Color(0xff2E8B57),
            ),

            onPressed: () {
              Get.to(
                ()=> ChatbotScreen(),
              );
            },

            child:
                const Text("Mulai Konsultasi"),
          ),
        ],
      ),
    );
  }
}