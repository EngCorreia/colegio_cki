import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

import '../../project/layers/core/const_strings/const_strings.dart';
import '../../project/layers/core/const_strings/user_information.dart';
import '../../project/layers/core/show_toast_message/show_toast_message.dart';
import '../../project/layers/presentation/controllers/financa_aluno_controller/financa_alunos_controller.dart';
import '../transport/transport_view_model.dart';

class RequestAtlViewViewModel extends BaseViewModel{

  RequestAtlViewViewModel({required double price}){
    prices = price;
    log("**** Request ATL View Model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;
  var result = AreaFinanceiraAluno();

  int qtd = 1;
  double prices = 0;
  double pricesTotal = 0;

  List<String> studentLis = [];
  List<Student> studentLisDoc = [];
  List<String> studentMonthLis = [];
  List<String> atl = [];
  Student? student;


  Future<String> summitStudent() async {

    List<Map<String, dynamic>> jsonMap = [];
    String msn = "";

    for(int index = 0; index < studentLis.length; index++){
      var resultStudent = studentLis[index];
      jsonMap.clear();
      for(int value = 0; value < studentMonthLis.length; value++){
        var list = {
          "mes": studentMonthLis[value].toString().toLowerCase(),
          "status": 0,
          "valor": prices
        };
        jsonMap.add(list);
      }

      if(StudentInformation.status == 1 && StudentInformation.userID!.isNotEmpty){
        try{
          var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
          collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("transporte")
              .doc(getId(resultStudent));
          var json = {
            "mensalidade": jsonMap
          };
          gravaFinancas.set(json);
          msn = "Transporte solicitado com sucesso...";
          //ShowToast.show_message_Success("Transporte solicitado com sucesso...");
        }catch(e){
          log(e.toString());
          msn =  e.toString();
          ShowToast.show_error(e.toString());
        }
      }
    }
    return msn;
  }

  String getId(String name){
    student = studentLisDoc.where((element) => element.name == name).first;
    log("***** ${student!.id}");
    return student!.id;
  }

  Future getStudent() async {
    if(StudentInformation.status == 1 && StudentInformation.userID!.isNotEmpty){
      try{
        var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
        collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
            .doc(StudentInformation.userID).snapshots();
        gravaFinancas.listen((resultSet) {
          if(resultSet.exists){
            atl.clear();
            Map<String,dynamic>? jsonList = resultSet.data();
            if(jsonList != null){
              List<dynamic> result = jsonList["filhos"];
              for(var list in result){
                atl.add(list["nomeAluno"]);
                studentLisDoc.add(Student(name: list["nomeAluno"],id: list["idAluno"]));
                notifyListeners();
              }
            }
          }
        });
      }catch(e){
        log(e.toString());
        ShowToast.show_error(e.toString());
      }
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

  String choose = "";

  setChoose(String value){

    choose = value;
    log("****1 $choose");
    notifyListeners();

  }
}