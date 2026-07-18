import 'package:flutter/material.dart';

class DiagnosisCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  /// warna card
  final Color backgroundColor;

  /// warna icon circle
  final Color iconBackground;

  const DiagnosisCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 62,
            height: 62,

            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              size: 32,
              color: Colors.green.shade700,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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