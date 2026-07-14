import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/controller/chatbot_controller.dart';
import 'package:sistem_pakar_skincare/views/chatbot/widgets/answer_button.dart';
import 'package:sistem_pakar_skincare/views/chatbot/widgets/chat_bubble.dart';
import 'package:sistem_pakar_skincare/views/chatbot/widgets/chatbot_avatar.dart';
import 'package:sistem_pakar_skincare/views/chatbot/widgets/progress_section.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({super.key});

  final ChatbotController controller =
      Get.put(ChatbotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konsultasi Skincare"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,

              children: [
                ProgressSection(
                  current:
                      controller.currentIndex.value + 1,
                  total:
                      controller.daftarGejala.length,
                ),

                const SizedBox(height: 30),

                ChatBubble(
                  message:
                      controller.gejalaSekarang.question,
                ),

                const SizedBox(height: 30),

                const Center(
                  child: ChatbotAvatar(),
                ),

                const Spacer(),

                AnswerButton(
                  text: "YA",
                  onPressed: () {
                    controller.jawab(true);
                  },
                ),

                AnswerButton(
                  text: "TIDAK",
                  onPressed: () {
                    controller.jawab(false);
                  },
                ),

                const SizedBox(height: 15),

                const Text(
                  "Jawablah pertanyaan dengan jujur agar hasil diagnosis lebih akurat.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
