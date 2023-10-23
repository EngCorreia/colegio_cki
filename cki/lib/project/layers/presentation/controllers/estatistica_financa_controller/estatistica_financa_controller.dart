
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
part 'estatistica_financa_controller.g.dart';

class EstatisticaGeralFinanca = _EstatisticaGeralFinanca with _$EstatisticaGeralFinanca;
abstract class _EstatisticaGeralFinanca with Store{

  @observable
  int? somatorioPago = 0;

  @observable
  int? somatorioNaoPago = 0;

  @observable
  int? geral = 0;


  void soma(){
    somatorioPago = totalJaneiroPago! + totalFevereiroPago! + totalMarcoPago!
        + totalAbrilPago! + totalMaioPago! + totalJunhoPago! + totalJulhoPago! + totalSetembroPago!+ totalOutubroPago!;
  }

  void somaNaoPago(){
    somatorioNaoPago = totalJaneiroNaoPago! + totalFevereiroNaoPago! + totalMarcoNaoPago! + totalAbrilNaoPago!
        + totalMaioNaoPago! + totalJunhoNaoPago! + totalJulhoNaoPago! + totalSetembroNaoPago! + totalOutubroNaoPago!;
  }
  void geralSoma(){
    geral = somatorioPago! + somatorioNaoPago!;
  }

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

  //FEVEREIRO 2024
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

  //MARÇO 2024
  @observable
  int? totalMarcoPago = 0;
  @observable
  int? totalMarcoNaoPago = 0;
  @observable
  List<dynamic> mesMarco = [];
  @computed
  List<dynamic> get mesMarcoPago => mesMarco.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesMarcoNaoPago => mesMarco.where((element) => element["status"] == 0).toList();

  //ABRIL 2024
  @observable
  int? totalAbrilPago = 0;
  @observable
  int? totalAbrilNaoPago = 0;
  @observable
  List<dynamic> mesAbril = [];
  @computed
  List<dynamic> get mesAbrilPago => mesAbril.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesAbrilNaoPago => mesAbril.where((element) => element["status"] == 0).toList();

  //MAIO 2024
  @observable
  int? totalMaioPago = 0;
  @observable
  int? totalMaioNaoPago = 0;
  @observable
  List<dynamic> mesMaio = [];
  @computed
  List<dynamic> get mesMaioPago => mesMaio.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesMaioNaoPago => mesMaio.where((element) => element["status"] == 0).toList();

  //JUNHO 2024
  @observable
  int? totalJunhoPago = 0;
  @observable
  int? totalJunhoNaoPago = 0;
  @observable
  List<dynamic> mesJunho = [];
  @computed
  List<dynamic> get mesJunhoPago => mesJunho.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesJunhoNaoPago => mesJunho.where((element) => element["status"] == 0).toList();

  //JULHO 2024
  @observable
  int? totalJulhoPago = 0;
  @observable
  int? totalJulhoNaoPago = 0;
  @observable
  List<dynamic> mesJulho = [];
  @computed
  List<dynamic> get mesJulhoPago => mesJulho.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesJulhoNaoPago => mesJulho.where((element) => element["status"] == 0).toList();

  //AGOSTO 2024
  @observable
  int? totalAgostoPago = 0;
  @observable
  int? totalAgostoNaoPago = 0;
  @observable
  List<dynamic> mesAgosto = [];
  @computed
  List<dynamic> get mesAgostoPago => mesAgosto.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesAgostoNaoPago => mesAgosto.where((element) => element["status"] == 0).toList();

  //SETEMBRO 2024
  @observable
  int? totalSetembroPago = 0;
  @observable
  int? totalSetembroNaoPago = 0;
  @observable
  List<dynamic> mesSetembro = [];
  @computed
  List<dynamic> get mesSetembroPago => mesSetembro.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesSetembroNaoPago => mesSetembro.where((element) => element["status"] == 0).toList();

  //OUTUBRO 2024
  @observable
  int? totalOutubroPago = 0;
  @observable
  int? totalOutubroNaoPago = 0;
  @observable
  List<dynamic> mesOutubro = [];
  @computed
  List<dynamic> get mesOutubroPago => mesOutubro.where((element) => element["status"] == 1).toList();
  @computed
  List<dynamic> get mesOutubroNaoPago => mesOutubro.where((element) => element["status"] == 0).toList();


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


  void marcoPago(){
    totalMarcoPago = 0;
    for(var pay in mesMarcoPago){
      if(mesMarcoPago.isEmpty){
        totalMarcoPago = 0;
      }else if(mesMarcoPago.length == 1){
        totalMarcoPago = pay["março"];
      }else if(mesMarcoPago.length >= 2){
        totalMarcoPago  = totalMarcoPago! + int.parse(pay["março"].toString());
      }
    }
  }

  void marcoNaoPago(){
    totalMarcoNaoPago = 0;
    for(var pay in mesMarcoNaoPago){
      if(mesMarcoNaoPago.isEmpty){
        totalMarcoNaoPago = 0;
      }else if(mesMarcoNaoPago.length == 1){
        totalMarcoNaoPago = pay["março"];
      }else if(mesMarcoNaoPago.length >= 2){
        totalMarcoNaoPago  = totalMarcoNaoPago! + int.parse(pay["março"].toString());
      }
    }
  }

  void abrilPago(){
    totalAbrilPago = 0;
    for(var pay in mesAbrilPago){
      if(mesAbrilPago.isEmpty){
        totalAbrilPago = 0;
      }else if(mesAbrilPago.length == 1){
        totalAbrilPago = pay["abril"];
      }else if(mesAbrilPago.length >= 2){
        totalAbrilPago  = totalAbrilPago! + int.parse(pay["abril"].toString());
      }
    }
  }

  void abrilNaoPago(){
    totalAbrilNaoPago = 0;
    for(var pay in mesAbrilNaoPago){
      if(mesAbrilNaoPago.isEmpty){
        totalAbrilNaoPago = 0;
      }else if(mesAbrilNaoPago.length == 1){
        totalAbrilNaoPago = pay["abril"];
      }else if(mesAbrilNaoPago.length >= 2){
        totalAbrilNaoPago  = totalAbrilNaoPago! + int.parse(pay["abril"].toString());
      }
    }
  }

  void maioPago(){
    totalMaioPago = 0;
    for(var pay in mesMaioPago){
      if(mesMaioPago.isEmpty){
        totalMaioPago = 0;
      }else if(mesMaioPago.length == 1){
        totalMaioPago = pay["maio"];
      }else if(mesMaioPago.length >= 2){
        totalMaioPago  = totalMaioPago! + int.parse(pay["maio"].toString());
      }
    }
  }

  void maioNaoPago(){
    totalMaioNaoPago = 0;
    for(var pay in mesMaioNaoPago){
      if(mesMaioNaoPago.isEmpty){
        totalMaioNaoPago = 0;
      }else if(mesMaioNaoPago.length == 1){
        totalMaioNaoPago = pay["maio"];
      }else if(mesMaioNaoPago.length >= 2){
        totalMaioNaoPago  = totalMaioNaoPago! + int.parse(pay["maio"].toString());
      }
    }
  }

  void junhoPago(){
    totalJunhoPago = 0;
    for(var pay in mesJunhoPago){
      if(mesJunhoPago.isEmpty){
        totalJunhoPago = 0;
      }else if(mesJunhoPago.length == 1){
        totalJunhoPago = pay["junho"];
      }else if(mesJunhoPago.length >= 2){
        totalJunhoPago  = totalJunhoPago! + int.parse(pay["junho"].toString());
      }
    }
  }

  void junhoNaoPago(){
    totalJunhoNaoPago = 0;
    for(var pay in mesJunhoNaoPago){
      if(mesJunhoNaoPago.isEmpty){
        totalJunhoNaoPago = 0;
      }else if(mesJunhoNaoPago.length == 1){
        totalJunhoNaoPago = pay["junho"];
      }else if(mesJunhoNaoPago.length >= 2){
        totalJunhoNaoPago  = totalJunhoNaoPago! + int.parse(pay["junho"].toString());
      }
    }
  }

  void julhoPago(){
    totalJulhoPago = 0;
    for(var pay in mesJulhoPago){
      if(mesJulhoPago.isEmpty){
        totalJulhoPago = 0;
      }else if(mesJulhoPago.length == 1){
        totalJulhoPago = pay["julho"];
      }else if(mesJulhoPago.length >= 2){
        totalJulhoPago  = totalJulhoPago! + int.parse(pay["julho"].toString());
      }
    }
  }

  void julhoNaoPago(){
    totalJulhoNaoPago = 0;
    for(var pay in mesJulhoNaoPago){
      if(mesJulhoNaoPago.isEmpty){
        totalJulhoNaoPago = 0;
      }else if(mesJulhoNaoPago.length == 1){
        totalJulhoNaoPago = pay["julho"];
      }else if(mesJulhoNaoPago.length >= 2){
        totalJulhoNaoPago  = totalJulhoNaoPago! + int.parse(pay["julho"].toString());
      }
    }
  }

  void agostoPago(){
    totalAgostoPago = 0;
    for(var pay in mesAgostoPago){
      if(mesAgostoPago.isEmpty){
        totalAgostoPago = 0;
      }else if(mesAgostoPago.length == 1){
        totalAgostoPago = pay["agosto"];
      }else if(mesAgostoPago.length >= 2){
        totalAgostoPago  = totalAgostoPago! + int.parse(pay["agosto"].toString());
      }
    }
  }

  void agostoNaoPago(){
    totalAgostoNaoPago = 0;
    for(var pay in mesAgostoNaoPago){
      if(mesAgostoNaoPago.isEmpty){
        totalAgostoNaoPago = 0;
      }else if(mesAgostoNaoPago.length == 1){
        totalAgostoNaoPago = pay["agosto"];
      }else if(mesAgostoNaoPago.length >= 2){
        totalAgostoNaoPago  = totalAgostoNaoPago! + int.parse(pay["agosto"].toString());
      }
    }
  }

  void setembroPago(){
    totalSetembroPago = 0;
    for(var pay in mesSetembroPago){
      if(mesSetembroPago.isEmpty){
        totalSetembroPago = 0;
      }else if(mesSetembroPago.length == 1){
        totalSetembroPago = pay["setembro"];
      }else if(mesSetembroPago.length >= 2){
        totalSetembroPago = totalSetembroPago! + int.parse(pay["setembro"].toString());
      }
    }
  }

  void setembroNaoPago(){
    totalAgostoNaoPago = 0;
    for(var pay in mesAgostoNaoPago){
      if(mesAgostoNaoPago.isEmpty){
        totalAgostoNaoPago = 0;
      }else if(mesAgostoNaoPago.length == 1){
        totalAgostoNaoPago = pay["setembro"];
      }else if(mesAgostoNaoPago.length >= 2){
        totalAgostoNaoPago  = totalAgostoNaoPago! + int.parse(pay["setembro"].toString());
      }
    }
  }

  void outubroPago(){
    totalOutubroPago = 0;
    for(var pay in mesOutubroPago){
      if(mesOutubroPago.isEmpty){
        totalOutubroPago = 0;
      }else if(mesOutubroPago.length == 1){
        totalOutubroPago = pay["outubro"];
      }else if(mesOutubroPago.length >= 2){
        totalOutubroPago = totalOutubroPago! + int.parse(pay["outubro"].toString());
      }
    }
  }

  void outubroNaoPago(){
    totalOutubroNaoPago = 0;
    for(var pay in mesOutubroNaoPago){
      if(mesOutubroNaoPago.isEmpty){
        totalOutubroNaoPago = 0;
      }else if(mesOutubroNaoPago.length == 1){
        totalOutubroNaoPago = pay["outubro"];
      }else if(mesOutubroNaoPago.length >= 2){
        totalOutubroNaoPago  = totalOutubroNaoPago! + int.parse(pay["outubro"].toString());
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

          if(meses["março"] != null){
            mesMarco.add(meses["março"]);
          }else{
            totalMarcoPago = 0;
            totalMarcoNaoPago = 0;
          }

          if(meses["abril"] != null){
            mesAbril.add(meses["abril"]);
          }else{
            totalAbrilPago = 0;
            totalAbrilNaoPago = 0;
          }

          if(meses["maio"] != null){
            mesMaio.add(meses["maio"]);
          }else{
            totalMaioPago = 0;
            totalMaioNaoPago = 0;
          }

          if(meses["junho"] != null){
            mesJunho.add(meses["junho"]);
          }else{
            totalJunhoPago = 0;
            totalJunhoNaoPago = 0;
          }

          if(meses["julho"] != null){
            mesJulho.add(meses["julho"]);
          }else{
            totalJulhoPago = 0;
            totalJulhoNaoPago = 0;
          }

          if(meses["agosto"] != null){
            mesAgosto.add(meses["agosto"]);
          }else{
            totalAgostoPago = 0;
            totalAgostoNaoPago = 0;
          }

          if(meses["setembro"] != null){
            mesSetembro.add(meses["setembro"]);
          }else{
            totalSetembroPago = 0;
            totalSetembroNaoPago = 0;
          }

          if(meses["outubro"] != null){
            mesOutubro.add(meses["outubro"]);
          }else{
            totalOutubroPago = 0;
            totalOutubroNaoPago = 0;
          }

        }


        janeiroPago();
        janeiroNaoPago();

        fevereiroPago();
        fevereiroNaoPago();

        marcoPago();
        marcoNaoPago();

        abrilPago();
        abrilNaoPago();

        maioPago();
        maioNaoPago();

        junhoPago();
        junhoNaoPago();

        julhoPago();
        julhoNaoPago();

        agostoPago();
        agostoNaoPago();

        setembroPago();
        setembroNaoPago();

        outubroPago();
        outubroNaoPago();


        soma();
        somaNaoPago();
        geralSoma();
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }
}