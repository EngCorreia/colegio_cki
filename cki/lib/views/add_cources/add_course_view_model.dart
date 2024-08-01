import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import '../../../app/modules/domain/entities/primeira_class_entity.dart';
import '../../../project/layers/core/const_strings/const_strings.dart';
import '../../../project/layers/core/show_toast_message/show_toast_message.dart';

class AddCourseViewViewModel extends BaseViewModel{

  AddCourseViewViewModel(){
    log("*** Add courses view model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;

  String? _value;
  bool verify = false;
  String? get values => _value;
  List<Map<String,dynamic>> myList = [];
  List<String> disciplinaList = [
    "Iniciação",
    "1ª_classe",
    "2ª_classe",
    "3ª_classe",
    "4ª_classe",
    "5ª_classe",
    "6ª_classe",
    "7ª_classe",
    "8ª_classe",
    "9ª_classe"
  ];
  List<PrimeiraClassDisciplinaEntity> alunonsList = [];
  String minhasDisciplinas = "";


  setValue(String value){
    if(value.isEmpty){
      _value = null;
      notifyListeners();
    }else{
      _value = value;
      notifyListeners();
    }

  }

  void verifyList(){
    var className = disciplia(_value.toString());
    var d = myList.map((e) => e.containsValue(e[className]));
    bool result = d.any((element) => element);
    verify = result;
    notifyListeners();
    //var ff = myList.map((e) => e[disciplinaName]);
    log("--------------------- ${myList.map((e) => e[className].toString())}");
  }

  String disciplia(String name){
    if(name == "Língua Portuguêsa"){
      minhasDisciplinas = "lingua_portuguesa";
      notifyListeners();
      return minhasDisciplinas;
    }else if(name == "Educação Física"){
      minhasDisciplinas = "educacao_fisica";
      notifyListeners();
      return minhasDisciplinas;
    }else if(name == "Química"){
      minhasDisciplinas = "quimica";
      notifyListeners();
      return minhasDisciplinas;
    }else{
      return "";
    }
  }

  Future createCourse({
    required int id,
    required String name,
    required String description,
    required int prices,
    required String subTittle,
    required String urlImage
  }) async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).
      collection("cursos").doc();
      var doc = {
        "description":description,
        "id":id,
        "imagesPath":urlImage,
        "name":name,
        "prices":prices,
        "subtittle":subTittle
      };
      readStudentResult.set(doc);
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }



}