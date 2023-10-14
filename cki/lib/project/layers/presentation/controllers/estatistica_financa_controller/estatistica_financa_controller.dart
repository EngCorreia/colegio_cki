
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
part 'estatistica_financa_controller.g.dart';

class EstatisticaGeralFinanca = _EstatisticaGeralFinanca with _$EstatisticaGeralFinanca;
abstract class _EstatisticaGeralFinanca with Store{

  //JANEIRO 2024
  @observable
  int? totalJaneiroPago = 0;
  @observable
  int? totalJaneiroNaoPago = 0;
  @observable
  List<dynamic> mesJaneiro = [];
  @computed
  List<dynamic> get mesJaneiroPago => mesJaneiro.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesJaneiroNaoPago => mesJaneiro.where((element) => element["status"] == 0).toList();

  //JFEVEREIRO 2024
  @observable
  int? totalFevereiroPago = 0;
  @observable
  int? totalFevereiroNaoPago = 0;
  @observable
  List<dynamic> mesFevereiro = [];
  @computed
  List<dynamic> get mesFevereiroPago => mesFevereiro.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesFevereiroNaoPago => mesFevereiro.where((element) => element["status"] == 0).toList();


  /**
   INICIO DOS METODOS MENSAISA
   */

  void janeiroPago(){
    totalJaneiroPago = 0;
    for(var pay in mesJaneiroPago){
      if(mesJaneiroPago.isEmpty){
        totalJaneiroPago = 0;
      }else if(mesJaneiroPago.length == 1){
        totalJaneiroPago = pay["janeiro"];
      }else if(mesJaneiroPago.length >= 2){
        totalJaneiroPago  = totalJaneiroPago! + int.parse(pay["janeiro"].toString());
      }
    }
  }

  void janeiroNaoPago(){
    totalJaneiroNaoPago = 0;
    for(var pay in mesJaneiroNaoPago){
      if(mesJaneiroNaoPago.isEmpty){
        totalJaneiroNaoPago = 0;
      }else if(mesJaneiroNaoPago.length == 1){
        totalJaneiroNaoPago = pay["janeiro"];
      }else if(mesJaneiroNaoPago.length >= 2){
        totalJaneiroNaoPago  = totalJaneiroNaoPago! + int.parse(pay["janeiro"].toString());
      }
    }
  }


  void fevereiroPago(){
    totalFevereiroPago = 0;
    for(var pay in mesFevereiroPago){
      if(mesFevereiroPago.isEmpty){
        totalFevereiroPago = 0;
      }else if(mesFevereiroPago.length == 1){
        totalFevereiroPago = pay["fevereiro"];
      }else if(mesFevereiroPago.length >= 2){
        totalFevereiroPago  = totalFevereiroPago! + int.parse(pay["fevereiro"].toString());
      }
    }
  }

  void fevereiroNaoPago(){
    totalFevereiroNaoPago = 0;
    for(var pay in mesFevereiroNaoPago){
      if(mesFevereiroNaoPago.isEmpty){
        totalFevereiroNaoPago = 0;
      }else if(mesFevereiroNaoPago.length == 1){
        totalFevereiroNaoPago = pay["fevereiro"];
      }else if(mesFevereiroNaoPago.length >= 2){
        totalFevereiroNaoPago  = totalFevereiroNaoPago! + int.parse(pay["fevereiro"].toString());
      }
    }
  }

  Future<void> readAllFinance() async{
    try{
      var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas").snapshots();
      gravaFinancas.listen((resultSet) {
        var list = resultSet.docs;
        mesJaneiro.clear();
        for(var s in list){
          Map<String, dynamic>? meses = s.data();
          if(meses["janeiro"] != null){
            mesJaneiro.add(meses["janeiro"]);
          }

          if(meses["fevereiro"] != null){
            mesFevereiro.add(meses["fevereiro"]);
          }else{
            totalFevereiroPago = 0;
            totalFevereiroNaoPago = 0;
          }
        }

        janeiroPago();
        janeiroNaoPago();

        fevereiroPago();
        fevereiroNaoPago();

      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }
}