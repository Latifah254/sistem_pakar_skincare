import 'package:flutter/material.dart';

class ProgressSection extends StatelessWidget {
  final int current;
  final int total;

  const ProgressSection({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Pertanyaan $current dari $total",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 10),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: current / total,
          ),
        ),

      ],
    );
  }
}