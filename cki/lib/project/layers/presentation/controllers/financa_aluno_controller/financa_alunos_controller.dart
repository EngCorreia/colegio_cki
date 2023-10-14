


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
  int? total = 0;

  @observable
  int? naoPago = 0;


  @observable
  ObservableList<Payment> paymentList = ObservableList();

  @computed
  List<Payment> get paymentPago => paymentList.where((element) => element.status == 1).toList();
  @computed
  List<Payment> get paymentNaoPago => paymentList.where((element) => element.status == 0).toList();

  @observable
  List<dynamic> list = [];



  Future<void> leituraFilhosFinancas() async{
    try{
      var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
          .doc(StudentInformation.userID).snapshots();
      gravaFinancas.listen((resultSet) {
        if(resultSet.exists){
          list.clear();
          Map<String,dynamic>? financas = resultSet.data();
          if(financas != null){
            list = financas["filhos"];
          }
        }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

  void pago(){
    total = 0;
    for(var pay in paymentPago){
      if(paymentPago.isEmpty){
        total = 0;
      }else if(paymentPago.length == 1){
        total = pay.value!;
      }else if(paymentPago.length >= 2){
        total  = total! + pay.value!;
      }
    }
  }

  void pagoN(){
    naoPago = 0;
    for(var pay in paymentNaoPago){
      if(paymentNaoPago.isEmpty){
        naoPago = 0;
      }else if(paymentNaoPago.length < 2){
        naoPago = pay.value!;
      }else if(paymentNaoPago.length >= 2){
        naoPago  = (naoPago ! + pay.value!);
      }
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
            "status": 0,
            "dia": Timestamp.now(),
            "id": myDay
          };
          gravaFinancasAluno.set(mes);
          pago();
          pagoN();

        }else{
          paymentList.clear();
          for(var lists in resultSet.docs){
            payment = Payment(
              idDocument: lists.id,
              date: lists["dia"],
              status: lists["status"],
              value: lists["valorPago"],
            );
            paymentList.add(payment!);
          }

          pago();
          pagoN();

        }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }


  Future<void> editControlFinance({required String studentId,required String fatherId}) async{
    try{
      var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
          .doc(fatherId).collection(studentId).orderBy("id").snapshots();
      gravaFinancas.listen((resultSet) {
        var list = resultSet.docs.length;
        if( list == 0){
          var myDay = Timestamp.now().toDate().month;
          var gravaFinancasAluno = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
          collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
              .doc(fatherId).collection(studentId).doc(converteDay(day: myDay));
          Map<String,dynamic> mes = {
            "valorPago": 0,
            "status": 0,
            "dia": Timestamp.now(),
            "id": myDay
          };
          gravaFinancasAluno.set(mes);

        }else{
          paymentList.clear();
          for(var lists in resultSet.docs){
            payment = Payment(
              idDocument: lists.id,
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


  Future<void> editControlFinanceStatus({required String studentId,required String fatherId,
    required String documentId,required int status,required String classe}) async{
    try{
      var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
          .doc(fatherId).collection(studentId).doc(documentId);
      if(status == 0){
        Map<String,dynamic> mes = {
          //"valorPago":0,
          "status": status,
        };

        gravaFinancas.update(mes);
      }else{
        Map<String,dynamic> mes = {
          "dia": Timestamp.now(),
          "status": status,
        };
        gravaFinancas.update(mes);
      }

      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection(Collections.collectionStudentRegister)
          .doc(Collections.collectionMatricula).collection(classe).doc(studentId);
      if(status == 0){
        Map<String,dynamic> mes = {
          "status": 0,
        };
        readStudentResult.update(mes);
      }else{
      }
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
