import 'package:flutter/material.dart';

import '../../../widgets/custom_card.dart';

class DiagnosisCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;

  const DiagnosisCard({

    super.key,

    required this.title,

    required this.value,

    required this.icon,

  });

  @override
  Widget build(BuildContext context) {

    return CustomCard(

      child: Row(

        children: [

          CircleAvatar(

            radius: 26,

            child: Icon(icon),

          ),

          const SizedBox(width: 18),

          Expanded(

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(

                  title,

                  style: const TextStyle(

                    color: Colors.grey,

                  ),

                ),

                const SizedBox(height: 5),

                Text(

                  value,

                  style: const TextStyle(

                    fontSize: 18,

                    fontWeight: FontWeight.bold,

                  ),

                ),

              ],

            ),

          )

        ],

      ),

    );

  }

}