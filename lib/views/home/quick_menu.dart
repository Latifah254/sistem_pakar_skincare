import 'package:flutter/material.dart';

class QuickMenu extends StatelessWidget {
  const QuickMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround,
      children: [
        menu(
          Icons.chat,
          "Konsultasi",
        ),

        menu(
          Icons.info,
          "About",
        ),
      ],
    );
  }

  Widget menu(
      IconData icon,
      String title,
  ) {

    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          child: Icon(icon),
        ),

        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}