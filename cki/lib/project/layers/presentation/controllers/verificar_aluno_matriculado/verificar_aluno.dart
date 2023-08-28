

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../core/const_strings/const_strings.dart';
import '../../../core/const_strings/user_information.dart';
part 'verificar_aluno.g.dart';

class VerificarAlunosMatriculado = _VerificarAlunosMatriculado with _$VerificarAlunosMatriculado;
abstract class _VerificarAlunosMatriculado with Store{


  @observable
  bool isStudent = false;
 // ObservableList<StudentDataEntity> studenteList = ObservableList<StudentDataEntity>();


  Future<void> verificarAlunosMatriculados({required String classe}) async{
    try{
      var readStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection(Collections.collectionStudentRegister)
          .doc(Collections.collectionMatricula).collection(classe).where("criado_por",isEqualTo: StudentInformation.userID).snapshots();
      readStudentResult.listen((resultSet) {
        for(var student in resultSet.docs){
          if(student.exists){
            isStudent = true;
          }else{
            isStudent = false;
          }
        }
      });
    }catch(e){


    }
  }
/*"classe": {"classeName": studentDataEntity.classeId,
    "periodo": studentDataEntity.periodo,
    },
    "numeroProcesso" : number
    */

}