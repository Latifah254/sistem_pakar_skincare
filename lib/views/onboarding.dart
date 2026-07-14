import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/theme/app_colors.dart';
import 'package:sistem_pakar_skincare/theme/app_text_styles.dart';
import 'package:sistem_pakar_skincare/views/home.dart';


class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });

}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final PageController pageController =
      PageController();

  int currentPage = 0;

  final List<OnboardingData> pages = [
    OnboardingData(
      image: "assets/images/onboarding1.png",
      title:
          "Kenali kulitmu,\ndapatkan perawatan terbaik untukmu",
      description:
          "Konsultasikan kondisi kulitmu dan dapatkan rekomendasi skincare yang sesuai.",
    ),

    OnboardingData(
      image: "assets/images/onboarding2.png",
      title:
          "Analisis Kulit dengan AI",
      description:
          "Sistem pakar menggunakan metode Forward Chaining untuk menganalisis kondisi kulitmu.",
    ),

    OnboardingData(
      image: "assets/images/onboarding3.png",
      title:
          "Rekomendasi Produk Terbaik",
      description:
          "Dapatkan rekomendasi skincare yang sesuai dengan jenis dan masalah kulitmu.",
    ),
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration:
            const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.off(
        () => const HomeScreen(),
      );
    }
  }

  void skip() {
    Get.off(
      () => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: skip,
                  child: const Text("Skip"),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page.image,
                          height: 280,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyles.heading1,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyles.body,
                        ),
                      ],
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 300),
                    margin:
                        const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),

                    width:
                        currentPage == index
                            ? 24
                            : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          currentPage == index
                              ? AppColors.primary
                              : Colors.grey.shade300,
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextPage,
                  child: Text(
                    currentPage == pages.length - 1
                        ? "Mulai"
                        : "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

