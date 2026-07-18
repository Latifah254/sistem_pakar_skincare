import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final double percentage;

  const MatchCard({
    super.key,
    required this.percentage,
  });

  String getStatus() {
    final value = percentage * 100;

    if (value >= 90) {
      return "Sangat Tinggi";
    }

    if (value >= 75) {
      return "Tinggi";
    }

    if (value >= 60) {
      return "Sedang";
    }

    return "Rendah";
  }

  Color getStatusColor() {
    final value = percentage * 100;

    if (value >= 90) {
      return const Color(0xff2E8B57);
    }

    if (value >= 75) {
      return Colors.green;
    }

    if (value >= 60) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final percent = (percentage * 100).round();

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

                Text(
                  getStatus(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: getStatusColor(),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "$percent% gejala sesuai dengan basis pengetahuan sistem.",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                    height: 1.5,
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
                    color: getStatusColor(),
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
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: getStatusColor(),
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