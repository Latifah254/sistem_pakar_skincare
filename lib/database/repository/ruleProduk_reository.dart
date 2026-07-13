import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/database/dummy/ruleProduk_dummy.dart';

class ProductRuleRepository {
  static List<Rule> getRules() {
    return ProductRuleDummy.data;
  }
}