import 'package:flutter/material.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        /// Greeting
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              Text(
                "Halo, SkinMate 👋",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1F2937),
                  letterSpacing: -.3,
                ),
              ),

              SizedBox(height: 6),

              Text(
                "Yuk, jaga kesehatan kulitmu!",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff6B7280),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        /// Notification
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {},

          child: Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xff2E8B57),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}