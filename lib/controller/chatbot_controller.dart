import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/database/repository/gejala_repository.dart';
import 'package:sistem_pakar_skincare/models/chat_message.dart';
import 'package:sistem_pakar_skincare/models/consultationResult.dart';
import 'package:sistem_pakar_skincare/models/gejala.dart';

import 'package:sistem_pakar_skincare/views/thinking/thinking_screen.dart';

import 'forwardChaining_controller.dart';

class ChatbotController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final RxMap<String, bool> jawaban = 
        <String, bool>{}.obs;

  final RxList<ChatMessage> messages = 
        <ChatMessage>[].obs;

  final RxList<Gejala> daftarGejala = 
        <Gejala>[].obs;

  final ForwardChainingController fc =
      Get.put(ForwardChainingController());

  final RxBool isFinished = false.obs;

  bool get dataLoaded => daftarGejala.isNotEmpty;

  Gejala get gejalaSekarang => daftarGejala[currentIndex.value];

  bool get isPertanyaanTerakhir =>
      currentIndex.value == daftarGejala.length - 1;

  double get progress {
    if (daftarGejala.isEmpty) return 0;
    return (currentIndex.value + 1) / daftarGejala.length;
  }

  @override
  void onInit() {
    super.onInit();

    messages.add(
      ChatMessage(
        text:
            "Halo SkinMate 👋\n\n"
            "Saya SkinSense AI.\n"
            "Saya akan membantu menganalisis kondisi kulitmu.\n\n"
            "Silakan jawab beberapa pertanyaan berikut.",
        isBot: true,
      ),
    );

    loadGejala();
  }

  Future<void> loadGejala() async {
    try {
      final data = await GejalaRepository.getGejala();

      daftarGejala.assignAll(data);

      if (daftarGejala.isNotEmpty) {
        messages.add(
          ChatMessage(
            text: gejalaSekarang.question,
            isBot: true,
          ),
        );
      } else {
        Get.snackbar(
          "Error",
          "Data gejala kosong",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal mengambil data gejala\n$e",
      );
    }
  }

  void jawab(bool nilai) {
    if (daftarGejala.isEmpty) return;

    jawaban[gejalaSekarang.code] = nilai;

    messages.add(
      ChatMessage(
        text: nilai ? "Ya" : "Tidak",
        isBot: false,
      ),
    );

    if (!isPertanyaanTerakhir) {
      currentIndex.value++;

      messages.add(
        ChatMessage(
          text: gejalaSekarang.question,
          isBot: true,
        ),
      );
    } else {
      isFinished.value = true;

      messages.add(
        ChatMessage(
          text:
              "Terima kasih 😊\n\n"
              "Saya sedang menganalisis jawabanmu...",
          isBot: true,
        ),
      );

      Future.delayed(
        const Duration(seconds: 1),
        () {
          selesaiKonsultasi();
        },
      );
    }
  }

  void reset() {
    currentIndex.value = 0;

    jawaban.clear();

    messages.clear();

    daftarGejala.clear();

    isFinished.value = false;

    onInit();
  }

  void selesaiKonsultasi() {
    final skinType = fc.diagnoseSkinType(jawaban);

    if (skinType == null) {
      Get.snackbar(
        "Diagnosis",
        "Jenis kulit tidak ditemukan",
      );
      return;
    }

    final skinProblem = fc.diagnoseSkinProblem(
      skinType,
      jawaban,
    );

    if (skinProblem == null) {
      Get.snackbar(
        "Diagnosis",
        skinType.name,
      );
      return;
    }

    final products = fc.recommendProducts(
      skinType,
      skinProblem,
    );

    final confidence = fc.calculateConfidence(
      skinType,
      skinProblem,
      jawaban,
    );

    final result = ConsultationResult(
      skinType: skinType,
      skinProblem: skinProblem,
      products: products,
      confidence: confidence,
    );

    Get.off(
      () => ThinkingScreen(
        result: result,
      ),
    );
  }
}