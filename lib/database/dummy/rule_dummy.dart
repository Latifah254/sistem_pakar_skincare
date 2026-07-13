import 'package:sistem_pakar_skincare/models/rule.dart';

class RuleDummy {
  static List<Rule> data = [
    Rule(
      kodeRule: "R01",
      gejala: [
        "G01",
        "G02",
        "G03",
      ],
      hasil: "JK01",
   ),

    Rule(
      kodeRule: "R02",
      gejala: [
        "G04",
        "G05",
      ],
      hasil: "JK02",
    ),
  ];
}