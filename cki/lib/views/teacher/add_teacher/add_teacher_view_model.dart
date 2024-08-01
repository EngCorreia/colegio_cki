

import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../project/layers/presentation/controllers/save_new_teacher_controller/save_new_teacher_controller.dart';

class AddTeacherViewModel extends BaseViewModel{

  AddTeacherViewModel(){
    log("**** Add Teacher View Model");
  }

  final controllerSaveNewTeacher = GetIt.I.get<SaveNewTeacherController>();

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

  List<String> classes = [
    "1ª - Classe Manhã",
    "1ª - Classe Tarde",
    "2ª - Classe Manhã",
    "2ª - Classe Tarde",
    "3ª - Classe",
    "4ª - Classe",
    "5ª - Classe",
    "6ª - Classe",
    "7ª - Classe",
    "8ª - Classe",
    "9ª - Classe",
  ];

  List<String> academic = [
    "Ensino Médio",
    "Bacharel",
    "Licenciatura",
    "Mestrado",
    "PHD",
    "Mestre",
  ];

  String choose = "";

  setChoose(String value){

    choose = value;
    log("****1 $choose");
    notifyListeners();

  }
}