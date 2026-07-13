import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/theme/app_colors.dart';
import 'package:sistem_pakar_skincare/theme/app_spacing.dart';
import 'package:sistem_pakar_skincare/theme/app_text_styles.dart';
import 'package:sistem_pakar_skincare/views/home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),

          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/onboarding.png",
                height: 300,
              ),

              const SizedBox(height: AppSpacing.xl),
              Text(
                "Kenali kulitmu,\ndapatkan perawatan\nterbaik untukmu",
                textAlign: TextAlign.center,
                style: AppTextStyles.heading1,
              ),

              const SizedBox(height: 16),
              Text(
                "Konsultasikan kondisi kulitmu\nmenggunakan AI dan dapatkan\nrekomendasi skincare yang sesuai.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  indicator(true),
                  indicator(false),
                  indicator(false),
                ],
              ),

              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Get.off(
                          () => const HomeScreen(),
                        );
                      },

                      child: const Text("Skip"),
                    ),
                  ),

                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off(
                          () => const HomeScreen(),
                        );
                      },

                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget indicator(bool active){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: active ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active
            ? AppColors.primary
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}