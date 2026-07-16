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

    final progress = current / total;

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.05),

            blurRadius: 18,

            offset: const Offset(0, 8),

          ),

        ],

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(

            "Progress Konsultasi",

            style: TextStyle(

              fontSize: 18,

              fontWeight: FontWeight.bold,

              color: Color(0xff1F2937),

            ),

          ),

          const SizedBox(height: 14),

          Row(

            children: [

              Text(

                "Pertanyaan $current dari $total",

                style: const TextStyle(

                  fontSize: 15,

                  fontWeight: FontWeight.w500,

                  color: Color(0xff4B5563),

                ),

              ),

              const Spacer(),

              Text(

                "${(progress * 100).toInt()}%",

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  color: Color.fromARGB(255, 70, 187, 121),

                  fontSize: 15,

                ),

              ),

            ],

          ),

          const SizedBox(height: 14),

          ClipRRect(

            borderRadius: BorderRadius.circular(30),

            child: LinearProgressIndicator(

              value: progress,

              minHeight: 10,

              backgroundColor: const Color(0xffE5E7EB),

              valueColor: const AlwaysStoppedAnimation(

                Color(0xff2E8B57),

              ),

            ),

          ),

        ],

      ),

    );

  }

}