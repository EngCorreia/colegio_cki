import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

class TransportViewModel extends BaseViewModel{

  TransportViewModel(){
    log("********* Transport view Model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;

}