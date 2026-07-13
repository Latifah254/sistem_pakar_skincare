import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/views/chatbot_screen.dart';

void main() {
  runApp(const SkinSenseApp());
}

class SkinSenseApp extends StatelessWidget {
  const SkinSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkinSense AI',
      home: ChatbotScreen(),
    );
  }
}
