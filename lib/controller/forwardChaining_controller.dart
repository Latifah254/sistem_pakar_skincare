import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/database/dummy/produk_dummy.dart';

import 'package:sistem_pakar_skincare/database/repository/rule_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/ruleMasalah_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/ruleProduk_reository.dart';

import 'package:sistem_pakar_skincare/database/dummy/jenisKulit_dummy.dart';
import 'package:sistem_pakar_skincare/database/dummy/masalahKulit_dummy.dart';

import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/models/jenisKulit.dart';
import 'package:sistem_pakar_skincare/models/masalahKulit.dart';
import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ForwardChainingController extends GetxController {

  final List<Rule> skinTyperules =
      RuleRepository.getRules();

  final List<Rule> skinProblemRules =
      ProblemRuleRepository.getRules();

  final List<Rule> productRules =
      ProductRuleRepository.getRules();

  final List<SkinType> skinTypes =
      SkinTypeDummy.data;

  final List<SkinProblem> skinProblems =
      SkinProblemDummy.data;

  final List<SkincareProduct> products =
      SkincareProductDummy.data;

  SkinType? diagnoseSkinType(
      Map<String, bool> jawaban) {

    for (Rule rule in skinTyperules) {

      bool cocok = true;

      for (String kodeGejala in rule.gejala) {

        if (jawaban[kodeGejala] != true) {

          cocok = false;

          break;

        }

      }

      if (cocok) {

        return skinTypes.firstWhere(

          (jenis) => jenis.code == rule.hasil,

        );

      }

    }

    return null;

  }

  SkinProblem? diagnoseSkinProblem(

    SkinType skinType,

    Map<String, bool> jawaban,

  ) {

    for (Rule rule in skinProblemRules) {

      bool cocok = true;

      for (String fakta in rule.gejala) {

        if (fakta.startsWith("JK")) {

          if (fakta != skinType.code) {

            cocok = false;

            break;

          }

        } else {

          if (jawaban[fakta] != true) {

            cocok = false;

            break;

          }

        }

      }

      if (cocok) {

        return skinProblems.firstWhere(

          (item) => item.code == rule.hasil,

        );

      }

    }

    return null;

  }

  List<SkincareProduct> recommendProducts(

    SkinType skinType,

    SkinProblem skinProblem,

  ) {

    List<SkincareProduct> rekomendasi = [];

    for (Rule rule in productRules) {

      bool cocok = true;

      for (String fakta in rule.gejala) {

        if (fakta.startsWith("JK")) {

          if (skinType.code != fakta) {

            cocok = false;

            break;

          }

        } else if (fakta.startsWith("MK")) {

          if (skinProblem.code != fakta) {

            cocok = false;

            break;

          }

        }

      }

      if (cocok) {

        try {

          final produk = products.firstWhere(

            (item) => item.code == rule.hasil,

          );

          rekomendasi.add(produk);

        } catch (_) {}

      }

    }

    return rekomendasi;

  }

    /// ==========================================
  /// MENGHITUNG TINGKAT KECOCOKAN (CONFIDENCE)
  /// ==========================================
  double calculateConfidence(
    SkinType skinType,
    SkinProblem skinProblem,
    Map<String, bool> jawaban,
  ) {
    double skinTypeScore = 0;
    double skinProblemScore = 0;

    // ==========================
    // RULE JENIS KULIT
    // ==========================
    for (Rule rule in skinTyperules) {
      if (rule.hasil != skinType.code) continue;

      int cocok = 0;

      for (String gejala in rule.gejala) {
        if (jawaban[gejala] == true) {
          cocok++;
        }
      }

      skinTypeScore = cocok / rule.gejala.length;
      break;
    }

    // ==========================
    // RULE MASALAH KULIT
    // ==========================
    for (Rule rule in skinProblemRules) {
      if (rule.hasil != skinProblem.code) continue;

      int cocok = 0;
      int total = 0;

      for (String fakta in rule.gejala) {
        total++;

        if (fakta.startsWith("JK")) {
          if (fakta == skinType.code) {
            cocok++;
          }
        } else {
          if (jawaban[fakta] == true) {
            cocok++;
          }
        }
      }

      skinProblemScore = cocok / total;
      break;
    }

    double confidence =
        ((skinTypeScore + skinProblemScore) / 2) * 100;

    if (confidence < 0) confidence = 0;
    if (confidence > 100) confidence = 100;

    return confidence;
  }
}