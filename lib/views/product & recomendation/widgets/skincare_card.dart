import 'package:flutter/material.dart';

import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class SkincareCard extends StatelessWidget {
  final SkincareProduct product;
  final VoidCallback onTap;

  const SkincareCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// FOTO
            Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(18),
              ),

              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 16),

            /// INFORMASI
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    product.category,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    product.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.45,
                      fontSize: 14,
                      color: Color(0xff555555),
                    ),
                  ),

                  const SizedBox(height: 14),

                  InkWell(
                    onTap: onTap,

                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text(
                          "Lihat Detail",
                          style: TextStyle(
                            color: Color(0xff2E8B57),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(width: 6),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xff2E8B57),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}