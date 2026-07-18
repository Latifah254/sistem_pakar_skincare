import 'package:sistem_pakar_skincare/models/jenisKulit.dart';
import 'package:sistem_pakar_skincare/models/masalahKulit.dart';
import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ConsultationResult {
  final SkinType skinType;
  final SkinProblem skinProblem;
  final List<SkincareProduct> products;
  final double confidence;

  ConsultationResult({
    required this.skinType,
    required this.skinProblem,
    required this.products,
    required this.confidence,
  });
}