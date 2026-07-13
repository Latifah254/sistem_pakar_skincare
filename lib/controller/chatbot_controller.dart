import 'package:get/get.dart';

import '../models/gejala.dart';
import '../database/dummy/gejala_dummy.dart';

class ChatbotController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxMap<String, bool> jawaban = <String, bool>{}.obs;
  final List<Gejala> daftarGejala = GejalaDummy.data;
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

  void selesaiKonsultasi() {
    Get.log("===== HASIL KONSULTASI =====");

    jawaban.forEach((key, value) {
      Get.log("$key : $value");
    });

    print(jawaban);

    Get.snackbar("Konsultasi",
    "Konsultasi Selesai",
    snackPosition: SnackPosition.BOTTOM,
    );
  }
}