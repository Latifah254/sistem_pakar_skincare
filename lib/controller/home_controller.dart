import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final PageController pageController = PageController();

  final RxInt currentPage = 0.obs;

  final List<String> tips = [

    "Gunakan sunscreen setiap pagi untuk melindungi kulit dari paparan sinar UV.",

    "Bersihkan wajah dua kali sehari agar kulit tetap sehat dan bebas kotoran.",

    "Gunakan pelembap sesuai jenis kulit agar skin barrier tetap terjaga.",

    "Perbanyak minum air putih agar kulit tetap terhidrasi dari dalam.",

  ];

  @override
  void onInit() {
    super.onInit();

    pageController.addListener(() {

      currentPage.value =
          pageController.page?.round() ?? 0;

    });
  }

  @override
  void onClose() {

    pageController.dispose();

    super.onClose();

  }

}