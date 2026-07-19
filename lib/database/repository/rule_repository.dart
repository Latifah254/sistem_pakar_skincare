import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/services/api_service.dart';

class RuleRepository {

  static Future<List<Rule>> getRules() async {

    final data =
        await ApiService.getRule("jenis_kulit");

    return data
        .map<Rule>((e)=>Rule.fromJson(e))
        .toList();

  }

}