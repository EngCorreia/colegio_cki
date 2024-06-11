import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

class RequestAtlViewViewModel extends BaseViewModel{

  RequestAtlViewViewModel(){
    log("**** Request ATL View Model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;

  List<String> atl = [
    "Domingos Manuel Lopes",
    "Paulo da Costa Pedro",
    "Gabriel Victor",
    "Correia Chumbo",
    "Carlos Lopes",
  ];

  String choose = "";

  setChoose(String value){

    choose = value;
    log("****1 $choose");
    notifyListeners();

  }
}