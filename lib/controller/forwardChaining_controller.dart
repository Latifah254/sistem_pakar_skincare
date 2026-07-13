import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/database/repository/rule_repository.dart';
import 'package:sistem_pakar_skincare/database/repository/ruleMasalah_repository.dart';

import 'package:sistem_pakar_skincare/database/dummy/jenisKulit_dummy.dart';
import 'package:sistem_pakar_skincare/database/dummy/masalahKulit_dummy.dart';

import 'package:sistem_pakar_skincare/models/rule.dart';
import 'package:sistem_pakar_skincare/models/jenisKulit.dart';
import 'package:sistem_pakar_skincare/models/masalahKulit.dart';

class ForwardChainingController extends GetxController {
  final List<Rule> 
        skinTyperules = RuleRepository.getRules();
  
  final List<Rule> skinProblemRules =
        ProblemRuleRepository.getRules();

  final List<SkinType> 
        skinTypes = SkinTypeDummy.data;

  final List<SkinProblem> skinProblems =
      SkinProblemDummy.data;

  SkinType? diagnoseSkinType (Map<String,bool> jawaban){
    for(Rule rule in skinTyperules){
      bool cocok = true;
      for(String kodeGejala in rule.gejala){
        if(jawaban[kodeGejala] != true){
          cocok = false;
          break;
        }
      }

      if(cocok){
        return skinTypes.firstWhere(
          (jenis) => jenis.code == rule.hasil,
        );
      }
    }
    return null;
  }

  SkinProblem? diagnoseSkinProblem(
    SkinType skinType,
    Map<String,bool> jawaban,
  ){

    for(Rule rule in skinProblemRules){
      bool cocok = true;
      for(String fakta in rule.gejala){
        if(fakta.startsWith("JK")){
          if(fakta != skinType.code){
            cocok = false;
            break;
          }
        }
        else{
          if(jawaban[fakta] != true){
            cocok = false;
            break;
          }
        }
      }

      if(cocok){
        return skinProblems.firstWhere(
          (item)=> item.code == rule.hasil,
        );
      }
    }
    return null;
  }
}