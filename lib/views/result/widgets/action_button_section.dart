import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/widgets/primary_button.dart';
import 'package:sistem_pakar_skincare/widgets/secondary_button.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: "Konsultasi Lagi",
          icon: Icons.refresh,
          onPressed: (){
              Get.back();
          },
        ),

        const SizedBox(height: 15),
        SecondaryButton(
          text: "Kembali ke Home",
          onPressed: (){
              Get.until(
                (route)=>route.isFirst,
              );
          },
        ),
      ],
    );
  }
}