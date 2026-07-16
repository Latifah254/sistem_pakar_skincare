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
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          child: Icon(Icons.spa),
        ),

        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(product.brand),
            const SizedBox(height: 5),
            Text(product.description),
          ],
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}