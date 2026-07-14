import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/controller/home_controller.dart';

class TipsCard extends StatelessWidget {
  TipsCard({super.key});

  final HomeController controller =
      Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Tips Hari Ini",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
            ...controller.tips.map(
              (tip)=> Padding(
                padding:
                    const EdgeInsets.only(
                  bottom: 10,
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(tip),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}