import 'package:get/get.dart';
import 'package:sistem_pakar_skincare/database/repository/rule_repository.dart';
import 'package:sistem_pakar_skincare/database/dummy/jenisKulit_dummy.dart';
import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/models/jenisKulit.dart';

class ForwardChainingController extends GetxController {
  final List<Rule> rules = RuleRepository.getRules();
  final List<SkinType> daftarJenisKulit = SkinTypeDummy.data;

  SkinType? proses(Map<String,bool> jawaban){
    for(Rule rule in rules){
      bool cocok = true;
      for(String kodeGejala in rule.gejala){
        if(jawaban[kodeGejala] != true){
          cocok = false;
          break;
        }
      }

      if(cocok){
        return daftarJenisKulit.firstWhere(
          (jenis) => jenis.code == rule.hasil,
        );
      }
    }
    return null;
  }
}