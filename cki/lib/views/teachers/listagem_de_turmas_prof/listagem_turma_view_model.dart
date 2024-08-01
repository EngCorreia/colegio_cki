
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

import '../../../modules/listagem_turma_professor/data/model/teacher_class_list_model.dart';
import '../../../modules/listagem_turma_professor/domain/entities/teacher_class_list_entity.dart';
import '../../../project/layers/core/const_strings/const_strings.dart';
import '../../../project/layers/core/show_toast_message/show_toast_message.dart';

class ListClassViewModel extends BaseViewModel{

  ListClassViewModel(){
    log("*** Listagem de turma view Model Prof");
  }

  String get env => dotenv.env['ENV']!;
  String get baseUrl => dotenv.env['BASE_URL']!;
  String get secondLogo => dotenv.env['LOGO_IMAGE_SECOND']!;

  List<TeacherClassListEntity> listTeacher = [];



  Future getTeacherClass() async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("professores").doc("UVxH7ipcv0eFmdFgir0e").snapshots();
      readStudentResult.listen((resultSet) {
        if(resultSet.exists){
          Map<String,dynamic>? turmas =  resultSet.data();
          List<dynamic> result = turmas!["turmas"];
          listTeacher.clear();
          for(var list in result){
            var teacher = TeacherClassListModel.fromJason(list);
            listTeacher.add(teacher);
            notifyListeners();
          }
        }
        //turmaList.clear();
        /*for(var turma in resultSet.docs){
          if(turma.exists){
            turmaEntity = TurmaEntity(
              id: turma.id,
              classe: turma["classe"],
              nome: turma["nome"],
              periodo: turma["periodo"],
              sala: turma["sala"],
            );
            turmaList.add(turmaEntity!);
          }
        }*/
      });
    }catch(e){
      log(e.toString());
      ShowToast.show_error(e.toString());
    }
  }

}