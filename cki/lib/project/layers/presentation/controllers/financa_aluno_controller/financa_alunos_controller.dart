


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../core/const_strings/user_information.dart';
import '../../../core/show_toast_message/show_toast_message.dart';
import '../../../domain/entities/pagamento_entity/pagamento_entity.dart';
part 'financa_alunos_controller.g.dart';


class AreaFinanceiraAluno = _AreaFinanceiraAluno with _$AreaFinanceiraAluno;
abstract class _AreaFinanceiraAluno with Store {

  @observable
  Payment? payment;

  @observable
  ObservableList<Payment> paymentList = ObservableList();

  @observable
  List<dynamic> list = [];

  Future<void> leituraFilhosFinancas() async{
    try{
      var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
          .doc(StudentInformation.userID).snapshots();
      gravaFinancas.listen((resultSet) {
        if(resultSet.exists){
          Map<String,dynamic>? financas = resultSet.data();
          if(financas != null){
           // log("************* ${financas["filhos"]}");
            list = financas["filhos"];
          }
        }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }


  Future<void> readControlFinance({required String studentId}) async{
    try{
      var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
          .doc(StudentInformation.userID).collection(studentId).orderBy("id").snapshots();
      gravaFinancas.listen((resultSet) {
        var list = resultSet.docs.length;
        if( list == 0){
          var myDay = Timestamp.now().toDate().month;
          var gravaFinancasAluno = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
          collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
              .doc(StudentInformation.userID).collection(studentId).doc(converteDay(day: myDay));
          Map<String,dynamic> mes = {
            "valorPago":0,
            "status":0,
            "dia": Timestamp.now(),
            "id": myDay
          };
          gravaFinancasAluno.set(mes);

        }else{
          paymentList.clear();
          for(var lists in resultSet.docs){
            payment = Payment(
              date: lists["dia"],
              status: lists["status"],
              value: lists["valorPago"],
            );
            paymentList.add(payment!);
          }
        }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

  String converteDay({required int day}){

    if(day == 1){
      return "janeiro";
    }else if(day == 2){
      return "fevereiro";
    }else if(day == 3){
      return "março";
    }else if(day == 4){
      return "abril";
    }else if(day == 5){
      return "maio";
    }else if(day == 6){
      return "junho";
    }else if(day == 7){
      return "julho";
    }else if(day == 8){
      return "agosto";
    }else if(day == 9){
      return "setembro";
    }else if(day == 10){
      return "outubro";
    }else if(day == 11){
      return "novembro";
    }else if(day == 12){
      return "dezembro";
    }else{
      return "";
    }
  }
}
