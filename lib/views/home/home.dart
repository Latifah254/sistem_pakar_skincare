import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/views/chatbot/chatbot_screen.dart';
import 'package:sistem_pakar_skincare/views/about/about_screen.dart';
import 'package:sistem_pakar_skincare/widgets/app_buttom_navbar.dart';

import 'banner_card.dart';
import 'greeting_card.dart';
import 'quick_menu.dart';
import 'tips_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Color(0xffF7FCF8),
              Colors.white,
            ],
          ),
        ),

        child: SafeArea(

          child: SingleChildScrollView(

            physics: const BouncingScrollPhysics(),

            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                /// Greeting
                const GreetingCard(),

                const SizedBox(height: 24),

                /// Banner Konsultasi
                BannerCard(
                  onStart: () {
                    Get.to(
                      () => ChatbotScreen(),
                    );
                  },
                ),

                const SizedBox(height: 28),

                /// Menu Lainnya
                QuickMenu(

                  onConsultation: () {
                    Get.snackbar(
                      "Segera Hadir",
                      "Fitur masih dalam pengembangan",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },

                  onAbout: () {
                    Get.to(
                      () => const AboutScreen(),
                    );
                  },

                ),

                const SizedBox(height: 28),

                /// Tips
                TipsCard(),

                const SizedBox(height: 25),

              ],

            ),

          ),

        ),

      ),

      bottomNavigationBar: AppBottomNavbar(

        currentIndex: 0,

        onTap: (index) {

          switch (index) {

            case 0:
              break;

            case 1:

              Get.to(
                () => ChatbotScreen(),
              );

              break;

            case 2:

              Get.to(
                () => const AboutScreen(),
              );

              break;

          }

        },

      ),

    );
  }
}