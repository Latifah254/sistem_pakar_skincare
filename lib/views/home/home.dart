import 'package:flutter/material.dart';
import 'package:sistem_pakar_skincare/views/home/banner_card.dart';
import 'package:sistem_pakar_skincare/views/home/greeting_card.dart';
import 'package:sistem_pakar_skincare/views/home/quick_menu.dart';
import 'package:sistem_pakar_skincare/views/home/tips_card.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
              const GreetingCard(),
              const SizedBox(height:20),
              const BannerCard(),
              const SizedBox(height:25),
              const QuickMenu(),
              const SizedBox(height:25),
              TipsCard(),
          ],
          ),
        ),
      )
    );
  }
}