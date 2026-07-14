import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black12,
          )
        ],
      ),

      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 25),
          const Text(
            "AI sedang menganalisis kondisi kulitmu...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),
          const Text(
            "Mohon tunggu beberapa saat",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}