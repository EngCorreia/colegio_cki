import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import '../../../app/modules/data/models/disciplina_model.dart';
import '../../../app/modules/data/models/primeira_classe_model.dart';
import '../../../app/modules/domain/entities/disciplina_class_entity.dart';
import '../../../app/modules/domain/entities/primeira_class_entity.dart';
import '../../../project/layers/core/const_strings/const_strings.dart';
import '../../../project/layers/core/show_toast_message/show_toast_message.dart';

class TeacherClassStudentViewModel extends BaseViewModel{

  final String value;
  TeacherClassStudentViewModel(this.value){
    log("*** Teacher class student view model");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;

  String? _value;
  bool verify = false;
  String? get values => _value;
  List<Map<String,dynamic>> myList = [];
  List<DisciplinaEntity> disciplinaList = [];
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


  Future lerDisciplinas() async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("disciplina_primeira_classe").snapshots();
      readStudentResult.listen((resultSet)  {
        disciplinaList.clear();
           for(var n in resultSet.docs){
             var ss = DisciplinaModel.fromJson(json: n.data());
             disciplinaList.add(ss);
             notifyListeners();
           }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

  Future getTeacherClass() async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).
      collection("professores").doc("UVxH7ipcv0eFmdFgir0e").collection(value).snapshots();
      readStudentResult.listen((resultSet) {

        alunonsList.clear();
          for(var list in resultSet.docs){
            myList.add(list.data());
            var teacher = PrimeiraClassDisciplinaModel.fromJson(list.id,json: list.data());
            alunonsList.add(teacher);
            notifyListeners();

        }
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

  Future atribuirNotas({required String id,
    required double primeira,
    required double segunda,
    required double terceira,
    required String disciplina
  }) async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).
      collection("professores").doc("UVxH7ipcv0eFmdFgir0e").collection(value).doc(id);
      if(disciplina == "Língua Portuguêsa"){
        var media = (primeira + segunda + terceira) / 3;
        var maps = {
          "lingua_portuguesa":{
            "primeira":primeira,
            "segunda": segunda,
            "terceira":terceira,
            "media": media
          },
        };
        readStudentResult.update(maps);
      }

      if(disciplina == "Educação Física"){
        double media = (primeira + segunda + terceira) / 3;
        var maps = {
          "educacao_fisica":{
            "primeira":primeira,
            "segunda": segunda,
            "terceira":terceira,
            "media": media.toDouble()
          },
        };
        readStudentResult.update(maps);
      }

    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

}