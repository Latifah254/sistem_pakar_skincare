import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/views/chatbot/chatbot_screen.dart';
import 'package:sistem_pakar_skincare/widgets/app_buttom_navbar.dart';
import 'package:sistem_pakar_skincare/views/about/about_screen.dart';

import 'banner_card.dart';
import 'greeting_card.dart';
import 'quick_menu.dart';
import 'tips_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingCard(),
              const SizedBox(height: 24),

              BannerCard(
                onStart: () {
                  Get.to(
                    ()=> ChatbotScreen(),
                  );
                },
              ),
              
              QuickMenu(
                onConsultation: (){
                    Get.to(()=>ChatbotScreen());
                },

                onAbout: (){
                    Get.to(()=>const AboutScreen());
                },
              ),
              
              TipsCard(),
              const SizedBox(height: 20),
            ],
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