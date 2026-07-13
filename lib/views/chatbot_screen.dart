import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/controller/chatbot_controller.dart';

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

      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: controller.progress,
              ),
              const SizedBox(height: 20),
              Text(
                "Pertanyaan ${controller.currentIndex.value + 1} dari ${controller.daftarGejala.length}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    controller.gejalaSekarang.question,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  controller.jawab(true);
                },
                child: const Text("YA"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  controller.jawab(false);
                },
                child: const Text("TIDAK"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
