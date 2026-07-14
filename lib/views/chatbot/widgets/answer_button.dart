import 'package:flutter/material.dart';

import 'package:sistem_pakar_skincare/widgets/primary_button.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnswerButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: PrimaryButton(
        text: text,
        onPressed: onPressed,
      ),
    );
  }
}