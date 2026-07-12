import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SkinSense AI"),
        ),
        body: const Center(
          child: Text(
            "Project Berhasil Dibuat",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
