
import 'package:cki/project/layers/data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource.dart';
import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/save_student_error.dart';
import '../../../dto/new_student_dto/new_student_dto.dart';

class SaveNewStudentDataSourceImp implements SaveNewStudentDataSource {

  bool isSaved = false;

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity,required int number}) async{

    try{
      var saveStudentResult = FirebaseFirestore.instance.collection("colegios").doc("kalabo_internacional").collection("2023_a_2024").doc("cki_2023").collection("estudante").doc();
      var result = StudentDto.fromJson(studentDataEntity,number);
      if(result.isNotEmpty){
        saveStudentResult.set(result);
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