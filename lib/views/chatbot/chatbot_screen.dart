import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/controller/chatbot_controller.dart';

import 'widgets/answer_button.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/progress_section.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({super.key});

  final ChatbotController controller =
      Get.put(ChatbotController());

  final ScrollController scrollController =
      ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "SkinSense AI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffEAF7EC),
              Colors.white,
            ],
          ),
        ),

        child: SafeArea(
          child: Obx(() {

            _scrollToBottom();

            return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    16,
                    20,
                    12,
                  ),
                  child: ProgressSection(
                    current:
                        controller.currentIndex.value + 1,
                    total:
                        controller.daftarGejala.length,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    itemCount:
                        controller.messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message:
                            controller.messages[index],
                      );
                    },
                  ),
                ),

                AnimatedSwitcher(
                  duration:
                      const Duration(milliseconds: 250),

                  child: controller.isFinished.value
                      ? const SizedBox.shrink()

                      : Container(
                          key:
                              const ValueKey("button"),

                          padding:
                              const EdgeInsets.fromLTRB(
                            16,
                            12,
                            16,
                            20,
                          ),

                          decoration: const BoxDecoration(
                            color: Colors.white,

                            borderRadius:
                                BorderRadius.only(
                              topLeft:
                                  Radius.circular(24),
                              topRight:
                                  Radius.circular(24),
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),

                          child: Row(
                            children: [

                              Expanded(
                                child: AnswerButton(
                                  text: "YA",
                                  onPressed: () {
                                    controller.jawab(true);
                                  },
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: AnswerButton(
                                  text: "TIDAK",
                                  onPressed: () {
                                    controller.jawab(false);
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}