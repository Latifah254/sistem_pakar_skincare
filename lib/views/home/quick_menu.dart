import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuickMenu extends StatelessWidget {

  final VoidCallback onConsultation;
  final VoidCallback onAbout;

  const QuickMenu({
    super.key,
    required this.onConsultation,
    required this.onAbout,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const SizedBox(height: 28),

        const Text(

          "Menu Lainnya (Segera Hadir)",

          style: TextStyle(

            fontSize: 20,

            fontWeight: FontWeight.bold,

            color: Color(0xff1F2937),

          ),

        ),

        const SizedBox(height: 18),

        Row(

          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

          children: [

            _menuItem(

              icon: Icons.history,

              title: "Riwayat",

              color: Colors.orange,

              onTap: () {

                Get.snackbar(

                  "Segera Hadir",

                  "Fitur Riwayat sedang dikembangkan",

                  snackPosition:
                      SnackPosition.BOTTOM,

                );

              },

            ),

            _menuItem(

              icon: Icons.article_outlined,

              title: "Artikel",

              color: Colors.blue,

              onTap: () {

                Get.snackbar(

                  "Segera Hadir",

                  "Fitur Artikel sedang dikembangkan",

                  snackPosition:
                      SnackPosition.BOTTOM,

                );

              },

            ),

            _menuItem(

              icon: Icons.info_outline,

              title: "Tentang",

              color: Colors.green,

              onTap: onAbout,

            ),

          ],

        ),

      ],

    );

  }

  Widget _menuItem({

    required IconData icon,

    required String title,

    required Color color,

    required VoidCallback onTap,

  }) {

    return InkWell(

      borderRadius: BorderRadius.circular(18),

      onTap: onTap,

      child: Column(

        children: [

          Container(

            width: 68,

            height: 68,

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(20),

              boxShadow: [

                BoxShadow(

                  color: Colors.black.withOpacity(.05),

                  blurRadius: 15,

                  offset: const Offset(0, 8),

                ),

              ],

            ),

            child: Icon(

              icon,

              color: color,

              size: 30,

            ),

          ),

          const SizedBox(height: 10),

          Text(

            title,

            style: const TextStyle(

              fontWeight: FontWeight.w600,

              fontSize: 14,

            ),

          ),

        ],

      ),

    );

  }

}