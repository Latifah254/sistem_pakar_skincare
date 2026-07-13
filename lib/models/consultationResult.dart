import 'jenisKulit.dart';
import 'masalahKulit.dart';
import 'produkSkincare.dart';

class ConsultationResult {
  final SkinType skinType;

  final SkinProblem skinProblem;

  final List<SkincareProduct> products;

  ConsultationResult({
    required this.skinType,
    required this.skinProblem,
    required this.products,
  });
}