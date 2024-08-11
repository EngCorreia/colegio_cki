import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../../../modules/finances/data/models/inscription_model.dart';
import '../../../../../modules/finances/data/models/paymentModel.dart';
import '../../../../../modules/finances/domain/entities/paymentEntity.dart';
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
  PaymentEntity? paymentEntity;

  @observable
  double? totalMonthly = 0.0;

  @observable
  double? naoPagoMonthly = 0.0;

  @observable
  double? total = 0.0;

  @observable
  double? naoPago = 0.0;


  // inscrição do aluno lista
  @observable
  ObservableList<InscriptionModel> inscriptionList = ObservableList();

  // Mensalidade do aluno lista
  @observable
  ObservableList<PaymentModels> paymentList = ObservableList();

  @computed
  List<dynamic> get inscriptionNotPay => paymentEntity!.inscriptionList.where((element) => element.status == 0).toList();
  @computed
  List<dynamic> get inscriptionPay => paymentEntity!.inscriptionList.where((element) => element.status == 1).toList();
  @computed
  List<dynamic> get monthlyNotPay => paymentEntity!.monthlyList.where((element) => element.status == 0).toList();
  @computed
  List<dynamic> get monthlyPay => paymentEntity!.monthlyList.where((element) => element.status == 1).toList();

  //-----------------------------------------------------------------------

  @observable
  ObservableList<Payment> paymentLists = ObservableList();

  @computed
  List<Payment> get paymentPago => paymentLists.where((element) => element.status == 1).toList();
  @computed
  List<Payment> get paymentNaoPago => paymentLists.where((element) => element.status == 0).toList();

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

  void pagoMonthly(){
    totalMonthly = 0.0;
    for(var pay in monthlyPay){
      if(monthlyPay.isEmpty){
        totalMonthly = 0.0;
      }else if(monthlyPay.length == 1){
        totalMonthly = double.parse(pay.valor!.toString());
      }else if(monthlyPay.length >= 2){
        totalMonthly  = totalMonthly! + double.parse(pay.valor!.toString());
      }
    }
  }

  void pagoNMonthly(){
    naoPagoMonthly = 0.0;
    for(var pay in monthlyNotPay){
      if(monthlyNotPay.isEmpty){
        naoPagoMonthly = 0.0;
      }else if(monthlyNotPay.length < 2){
        naoPagoMonthly = double.parse(pay.valor.toString());
      }else if(monthlyNotPay.length >= 2){
        naoPagoMonthly  = (naoPagoMonthly ! + pay.valor);
      }
    }
  }

  void pago(){
    total = 0.0;
    for(var pay in inscriptionPay){
      if(inscriptionPay.isEmpty){
        total = 0.0;
      }else if(inscriptionPay.length == 1){
        total = double.parse(pay.valor!.toString());
      }else if(inscriptionPay.length >= 2){
        total  = total! + double.parse(pay.valor!.toString());
      }
    }
  }

  void pagoN(){
    naoPago = 0.0;
    for(var pay in inscriptionNotPay){
      if(inscriptionNotPay.isEmpty){
        naoPago = 0.0;
      }else if(inscriptionNotPay.length < 2){
        naoPago = double.parse(pay.valor.toString());
      }else if(inscriptionNotPay.length >= 2){
        naoPago  = (naoPago ! + pay.valor);
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
            "valorPago":30000,
            "status": 0,
            "dia": Timestamp.now(),
            "id": myDay
          };
          gravaFinancasAluno.set(mes).whenComplete((){
            pago();
            pagoN();
          });

        }else{
          paymentList.clear();
          for(var lists in resultSet.docs){
            payment = Payment(
              idDocument: lists.id,
              date: lists["dia"],
              status: lists["status"],
              value: lists["valorPago"],
            );
            paymentLists.add(payment!);
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
            "valorPago": 30000,
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
            paymentLists.add(payment!);
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

  //-----------------------------------------------------------

  // MENSALIDADE DO ALUNO
  Future getPaymentListStudent() async{
  try{
    var response = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
    collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("cki-financas").where("uuid",isEqualTo: StudentInformation.userID).snapshots();
    response.listen((resultSet) {
      var listResult = resultSet.docs;
      paymentList.clear();
      for(var student in listResult){
        paymentList.add(PaymentModels.fromJson(json: student.data(),id: student.id));
        log("-----payList ${paymentList.length}");
      }
    });
  }catch(e){
    log(e.toString());
    ShowToast.show_error(e.toString());
  }
}

  Future getPaymentStudentById({required String studentId}) async{
    try{
      var response = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("cki-financas").doc(studentId).snapshots();
      response.listen((resultSet) {
        var listResult = resultSet.data();
       log("----------- $listResult");
        paymentEntity = PaymentModels.fromJson(json: listResult!, id: studentId);
        pago();
        pagoN();

        pagoMonthly();
        pagoNMonthly();
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }
}
