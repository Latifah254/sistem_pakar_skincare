import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/models/consultationResult.dart';
import 'package:sistem_pakar_skincare/views/thinking/thinking_screen.dart';

import '../models/gejala.dart';
import '../database/dummy/gejala_dummy.dart';
import 'forwardChaining_controller.dart';

class ChatbotController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final RxMap<String, bool> jawaban = <String, bool>{}.obs;

  final List<Gejala> daftarGejala = GejalaDummy.data;

  final ForwardChainingController fc =
    Get.put(ForwardChainingController());

  Gejala get gejalaSekarang => daftarGejala[currentIndex.value];

  bool get isPertanyaanTerakhir =>
      currentIndex.value == daftarGejala.length - 1;
  double get progress =>
      (currentIndex.value + 1) / daftarGejala.length;

  void jawab(bool nilai) {
    jawaban[gejalaSekarang.code] = nilai;
    if (!isPertanyaanTerakhir) {
      currentIndex.value++;
    } else {
      selesaiKonsultasi();
    }
  }

  void kembali() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void reset() {
    currentIndex.value = 0;
    jawaban.clear();
  }

  void selesaiKonsultasi(){
    final skinType =
        fc.diagnoseSkinType(jawaban);

    if(skinType == null){
      Get.snackbar(
        "Diagnosis",
        "Jenis kulit tidak ditemukan",
      );
      return;
    }

    final skinProblem =
        fc.diagnoseSkinProblem(
            skinType,
            jawaban,
        );

    if(skinProblem == null){
      Get.snackbar(
        "Diagnosis",
        skinType.name,
      );
      return;
    }

    final rekomendasi =
      fc.recommendProducts(
        skinType,
        skinProblem,
      );

    final result = ConsultationResult(
      skinType: skinType,
      skinProblem: skinProblem,
      products: rekomendasi,
  );

    Get.to(
      () => ThinkingScreen(
                result: result));

  }
}