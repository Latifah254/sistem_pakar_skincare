import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/services/api_service.dart';

class ProductRuleRepository {

  static Future<List<Rule>> getRules() async {

    final data =
        await ApiService.getRule("produk");

    return data
        .map<Rule>((e)=>Rule.fromJson(e))
        .toList();

  }

}