import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final double percentage;

  const MatchCard({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (percentage * 100).toInt();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffEEF9F1),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  "Tingkat Kecocokan",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Strong Match",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "$percent% sesuai dengan kondisi kulitmu",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

          SizedBox(
            width: 95,
            height: 95,
            child: Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 8,
                    backgroundColor: Colors.green.shade100,
                    color: const Color(0xff2E8B57),
                  ),
                ),

                Container(
                  width: 68,
                  height: 68,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),

                Text(
                  "$percent%",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2E8B57),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}