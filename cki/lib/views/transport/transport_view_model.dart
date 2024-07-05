

import 'dart:developer';

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
  double prices = 25000;
  double pricesTotal = 0;


  initValue(){
      pricesTotal = prices * qtd;
      notifyListeners();
  }

  setAddValue(){
    if(qtd < 9){
      qtd = qtd + 1;
      pricesTotal = prices * qtd;
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