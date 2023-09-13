
import 'dart:developer';

import 'package:cki/project/layers/data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource.dart';
import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/const_strings/const_strings.dart';
import '../../../../core/const_strings/user_information.dart';
import '../../../../core/errors/save_student_error.dart';
import '../../../dto/new_student_dto/new_student_dto.dart';

class SaveNewStudentDataSourceImp implements SaveNewStudentDataSource {


  bool isSaved = false;
  var studentId;

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity,required int number,required String classe}) async{

    try{
      bool readed = false;
      var saveStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
      collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection(Collections.collectionStudentRegister)
          .doc(Collections.collectionMatricula).collection(classe).doc();
      var result = StudentDto.fromJson(studentDataEntity,number,classe);
      studentId = saveStudentResult.id;
      if(result.isNotEmpty){
        saveStudentResult.set(result).whenComplete(() async{
          var saveStudentResult = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
          collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
              .doc(StudentInformation.userID).snapshots();
          saveStudentResult.listen((event) {
            if(event.exists){
              if(readed == false){
                Map<String,dynamic>? filhos = event.data();
                List<dynamic> resultSet = filhos!["filhos"];
                Map<String,dynamic> financas = {
                  "idAluno": studentId,
                  "nomeAluno": result["nome_aluno"],
                };
                resultSet.add(financas);
                var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
                collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
                    .doc(StudentInformation.userID);
                Map<String,dynamic> update = {
                  "filhos": resultSet,
                };
                gravaFinancas.update(update);
                readed = true;
              }
            }else{
              var gravaFinancas = FirebaseFirestore.instance.collection(Collections.school).doc(Collections.colegioName).
              collection(Collections.collectionAnoLectivo).doc(Collections.anoLectivo).collection("financas")
                  .doc(StudentInformation.userID);
              Map<String,dynamic> financas = {
                "idAluno": studentId,
                "nomeAluno": result["nome_aluno"],
              };

              Map<String,dynamic> newUpadte = {
                "filhos": [financas],
              };
              gravaFinancas.set(newUpadte);
            }
          });

        });
        isSaved = true;
        return Right(isSaved);
      }else{
        return Left(SaveStudentError("error ao salvar novo aluno"));
      }

    }catch(e){
      return Left(SaveStudentError(e.toString()));
    }
  }

}