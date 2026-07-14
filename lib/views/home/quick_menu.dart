import 'package:flutter/material.dart';
import 'package:sistem_pakar_skincare/widgets/feature_menu.dart';

class QuickMenu extends StatelessWidget {

  final VoidCallback onConsultation;
  final VoidCallback onAbout;
  
  const QuickMenu({
    super.key, 
    required this.onConsultation, 
    required this.onAbout});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround,
      children: [
        FeatureMenu(
          icon: Icons.chat,
          title: "Konsultasi",
          onTap: onConsultation,
        ),

        FeatureMenu(
          icon: Icons.info,
          title: "About",
          onTap: onAbout,
        ),
      ],
    );
  }
}