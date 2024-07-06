

import 'dart:developer';

import 'package:cki/project/layers/core/show_toast_message/show_toast_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

import '../../project/layers/core/const_strings/const_strings.dart';
import '../../project/layers/core/const_strings/user_information.dart';
import '../../project/layers/presentation/controllers/financa_aluno_controller/financa_alunos_controller.dart';

class TransportViewModel extends BaseViewModel{

  TransportViewModel(){
    log("********* Transport view Model");
    log("***** ${StudentInformation.status}");

  }


  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;
  var result = AreaFinanceiraAluno();

  int qtd = 1;
  double prices = 30000;
  double pricesTotal = 0;

  List<String> studentLis = [];
  List<String> studentMonthLis = [];
  List<String> atl = [];

  List<String> mes = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];


  Future getStudent() async {
    if(StudentInformation.status == 1 && StudentInformation.userID!.isNotEmpty){
        try{
          var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
          collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
              .doc(StudentInformation.userID).snapshots();
          gravaFinancas.listen((resultSet) {
            if(resultSet.exists){
              //list.clear();
              Map<String,dynamic>? financas = resultSet.data();
              if(financas != null){
                List<dynamic> result = financas["filhos"];
                for(var list in result){
                  atl.add(list["nomeAluno"]);
                  notifyListeners();
                  log("*** ${list["nomeAluno"]}");
                }
                //

              }
            }
          });
        }catch(e){
          log(e.toString());
          ShowToast.show_error(e.toString());

      }
     // result.leituraFilhosFinancas();
    }

  }



  initValue(){
      pricesTotal = prices * studentLis.length;
      notifyListeners();
  }

  setAddValue(){
    if(studentLis.length < 9){
      pricesTotal = prices * studentLis.length * studentMonthLis.length;
      notifyListeners();
    }
  }

  delete(int index){
    if(studentLis.length < 9){
      studentLis.removeAt(index);
      notifyListeners();
    }
  }
  addStudent(String student){
    if(studentLis.contains(student)){
      ShowToast.show_error("${student.toUpperCase()} Ja foi adicionado na sua lista");
    }else{
      studentLis.add(student);
      notifyListeners();
    }
  }

  deleteMonth(int index){
    if(studentMonthLis.length < 9){
      studentMonthLis.removeAt(index);
      notifyListeners();
    }
  }
  addStudentMonth(String student){
    if(studentMonthLis.contains(student)){
      ShowToast.show_error("${student.toUpperCase()} ja foi adicionado na sua lista");
    }else{
      studentMonthLis.add(student);
      notifyListeners();
    }

  }

  setDecrementValue(){
    if(qtd > 1){
      pricesTotal = pricesTotal - prices;
      qtd = qtd - 1;
      notifyListeners();
    }
  }
}