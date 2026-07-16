import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final VoidCallback onStart;

  const BannerCard({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff37A866),
            Color(0xff2E8B57),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: const Color(0xff2E8B57).withOpacity(.18),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Mulai Konsultasi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Jawab beberapa pertanyaan\nseputar kondisi kulitmu",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            height: 56,

            child: ElevatedButton(

              onPressed: onStart,

              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.white,

                foregroundColor: const Color(0xff2E8B57),

                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(18),
                ),

              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: const [

                  Text(
                    "Mulai Sekarang",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(width: 10),

                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}