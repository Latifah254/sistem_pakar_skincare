import 'package:flutter/material.dart';

import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ProductCard extends StatelessWidget {
  final SkincareProduct product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.spa),
        ),

        title: Text(product.name),
        subtitle: Text(product.brand),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}