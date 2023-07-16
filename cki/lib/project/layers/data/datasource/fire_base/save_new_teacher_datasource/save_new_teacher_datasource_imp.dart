import 'package:cki/project/layers/data/datasource/fire_base/save_new_teacher_datasource/save_new_teacher_datasource.dart';
import 'package:cki/project/layers/domain/entities/teachers_entity/teachers_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/const_strings/const_strings.dart';
import '../../../../core/errors/save_teacher_error.dart';
import '../../../dto/new_teacher_dto/teacher_dto.dart';

class CreateNewTeachersDataSourceImp implements CreateNewTeachersDataSource{

  @override
  Future<Either<SaveTeacherError, bool>> call({required TeachersEntity teachersEntity}) async{
    try{
      var saveTeacherResult = FirebaseFirestore.instance.collection(Collections.school).doc("kalabo_internacional").
    collection(Collections.teachers).doc();
      var result = TeachersDto.fromJson(teachersEntity: teachersEntity);
      if(result.isNotEmpty){
        saveTeacherResult.set(result);
        return const Right(true);
      }else{
        return Left(SaveTeacherError("Error ao salvar um novo professor"));
      }

    }catch(e){
      return Left(SaveTeacherError(e.toString()));
    }
  }

}