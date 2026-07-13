import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/database/dummy/ruleMasalah_dummy.dart';

class ProblemRuleRepository {
  static List<Rule> getRules() {
    return ProblemRuleDummy.data;
  }
}