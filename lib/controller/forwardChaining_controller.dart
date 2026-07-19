import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/database/repository/problem_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/produk_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/ruleMasalah_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/ruleProduk_reository.dart';
import 'package:sistem_pakar_skincare/database/repository/rule_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/skinType_repository.dart';

import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/models/jenisKulit.dart';
import 'package:sistem_pakar_skincare/models/masalahKulit.dart';
import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ForwardChainingController extends GetxController {

  final RxList<Rule> skinTypeRules = <Rule>[].obs;
  final RxList<Rule> skinProblemRules = <Rule>[].obs;
  final RxList<Rule> productRules = <Rule>[].obs;

  final RxList<SkinType> skinTypes = <SkinType>[].obs;
  final RxList<SkinProblem> skinProblems = <SkinProblem>[].obs;
  final RxList<SkincareProduct> products = <SkincareProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {

    skinTypes.assignAll(
      await SkinTypeRepository.getSkinTypes(),
    );

    skinProblems.assignAll(
      await SkinProblemRepository.getSkinProblems(),
    );

    products.assignAll(
      await ProductRepository.getProducts(),
    );

    skinTypeRules.assignAll(
      await RuleRepository.getRules(),
    );

    skinProblemRules.assignAll(
      await ProblemRuleRepository.getRules(),
    );

    productRules.assignAll(
      await ProductRuleRepository.getRules(),
    );

    // print("Skin Type : ${skinTypes.length}");
    // print("Rule JK : ${skinTypeRules.length}");

    // print("===== DATA SKIN TYPE =====");
    // for (var s in skinTypes) {
    //   print("${s.code} - ${s.name}");
    // }

    // print("===== DATA RULE JK =====");
    // for (var r in skinTypeRules) {
    //   print("${r.kodeRule} -> ${r.hasil} -> ${r.gejala}");
    // }
  }

  // DIAGNOSA JENIS KULIT

  SkinType? diagnoseSkinType(Map<String, bool> jawaban) {

      print("===== JAWABAN USER =====");
      print(jawaban);

      print("===== RULE =====");

      for (Rule rule in skinTypeRules) {

        print("Rule ${rule.kodeRule}");

        bool cocok = true;

        for (String gejala in rule.gejala) {

          print("$gejala = ${jawaban[gejala]}");

          if (jawaban[gejala] != true) {
            cocok = false;
            break;
          }

        }

        print("Cocok = $cocok");

        if (cocok) {

          print("HASIL ${rule.hasil}");

          final index =
              skinTypes.indexWhere((e) => e.code == rule.hasil);

          if (index != -1) {
            return skinTypes[index];
          }

        }

      }

      print("TIDAK ADA YANG COCOK");

      return null;
    }

  // DIAGNOSA MASALAH KULIT

  SkinProblem? diagnoseSkinProblem(
    SkinType skinType,
    Map<String, bool> jawaban,
  ) {

    Rule? bestRule;
    int bestMatch = -1;

    for (final rule in skinProblemRules) {

      bool valid = true;
      int match = 0;
      int total = 0;

      for (final fakta in rule.gejala) {

        total++;

        if (fakta.startsWith("JK")) {

          if (fakta == skinType.code) {
            match++;
          } else {
            valid = false;
            break;
          }

        } else {

          if (jawaban[fakta] == true) {
            match++;
          }

        }

      }

      if (!valid) continue;

      // Prioritas jika semua fakta terpenuhi
      if (match == total) {

        final index = skinProblems.indexWhere(
          (e) => e.code == rule.hasil,
        );

        if (index != -1) {
          return skinProblems[index];
        }

      }

      // Simpan rule dengan kecocokan terbesar
      if (match > bestMatch) {
        bestMatch = match;
        bestRule = rule;
      }

    }

    // fallback
    if (bestRule != null) {

      final index = skinProblems.indexWhere(
        (e) => e.code == bestRule!.hasil,
      );

      if (index != -1) {
        return skinProblems[index];
      }

    }

    return null;
  }

  // REKOMENDASI PRODUK
  
  List<SkincareProduct> recommendProducts(
    SkinType skinType,
    SkinProblem skinProblem,
  ) {

    final List<SkincareProduct> hasil = [];
    final Set<String> added = {};

    for (final rule in productRules) {

      bool cocok = true;

      for (final fakta in rule.gejala) {

        if (fakta.startsWith("JK")) {

          if (fakta != skinType.code) {
            cocok = false;
            break;
          }

        }

        else if (fakta.startsWith("PK")) {

          if (fakta != skinProblem.code) {
            cocok = false;
            break;
          }

        }

      }

      if (!cocok) continue;

      final index = products.indexWhere(
        (e) => e.code == rule.hasil,
      );

      if (index == -1) continue;

      if (!added.contains(products[index].code)) {

        hasil.add(products[index]);
        added.add(products[index].code);

      }

    }

    return hasil;
  }

  // MENGHITUNG TINGKAT KECOCOKAN DIAGNOSA

    double calculateConfidence(
      SkinType skinType,
      SkinProblem skinProblem,
      Map<String, bool> jawaban,
    ) {
      
      // MENGHITUNG SCORE JENIS KULIT (40%)

      double skinScore = 0;

      final skinRule = skinTypeRules.firstWhere(
        (rule) => rule.hasil == skinType.code,
      );

      int skinMatch = 0;

      for (final gejala in skinRule.gejala) {
        if (jawaban[gejala] == true) {
          skinMatch++;
        }
      }

      skinScore = skinMatch / skinRule.gejala.length;

      // MENGHITUNG MASALAH KULIT (60%)

      final Set<String> problemSymptoms = {};

      for (final rule in skinProblemRules) {
        if (rule.hasil != skinProblem.code) continue;

        for (final fakta in rule.gejala) {
          if (fakta.startsWith("G")) {
            problemSymptoms.add(fakta);
          }
        }
      }

      int problemMatch = 0;

      for (final gejala in problemSymptoms) {
        if (jawaban[gejala] == true) {
          problemMatch++;
        }
      }

      double problemScore = 0;

      if (problemSymptoms.isNotEmpty) {
        problemScore = problemMatch / problemSymptoms.length;
      }

      // ===========================
      // TOTAL SCORE
      // ===========================

      double total =
          (skinScore * 0.4) +
          (problemScore * 0.6);

      return total * 100;
    }
}