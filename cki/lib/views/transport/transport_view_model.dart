

import 'dart:developer';

import 'package:cki/project/layers/core/show_toast_message/show_toast_message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

class TransportViewModel extends BaseViewModel{

  TransportViewModel(){
    log("********* Transport view Model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;

  int qtd = 1;
  double prices = 30000;
  double pricesTotal = 0;

  List<String> studentLis = [];
  List<String> studentMonthLis = [];
  List<String> atl = [
    "Domingos Manuel Lopes",
    "Paulo da Costa Pedro",
    "Gabriel Victor Chumbo",
    "Correia António Chumbo",
    "Carlos Lopes Manuel",
  ];

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