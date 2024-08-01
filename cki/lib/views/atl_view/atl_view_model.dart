import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

class AtlViewModel extends BaseViewModel{

  AtlViewModel(){
    log("********* Transport view Model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;

  List<String> atl = [
    "Aulas de reforço",
    "Resolução de tarefas",
    "Aulas de Inglês",
    "Música",
    "Dança",
    "Violino",
    "Flauta",
    "Piano",
    "Artes plásticas"
  ];

}