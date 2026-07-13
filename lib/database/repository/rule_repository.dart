import 'package:sistem_pakar_skincare/database/dummy/rule_dummy.dart';
import 'package:sistem_pakar_skincare/models/rule.dart';

class RuleRepository {
  static List<Rule> getRules(){
    return RuleDummy.data;
  }
}