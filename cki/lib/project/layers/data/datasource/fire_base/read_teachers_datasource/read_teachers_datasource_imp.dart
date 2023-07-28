


import 'package:cki/project/layers/core/errors/application_error.dart';
import 'package:cki/project/layers/data/datasource/fire_base/read_teachers_datasource/read_teachers_datasource.dart';
import 'package:cki/project/layers/domain/entities/teachers_entity/teachers_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/save_teacher_error.dart';
import '../../../dto/new_teacher_dto/teacher_dto.dart';

class ReadTeachersDataSourceImp implements ReadTeachersDataSource{

  TeachersDto teachersDto = TeachersDto();

  @override
  Future<Either<ApplicationError, List<TeachersEntity>>> call() async{
    try{
      var readTeachersResult = await FirebaseFirestore.instance.collection("colegios").doc("kalabo_internacional")
          .collection("2023_a_2024").doc("cki_2023").collection("professores").get();
      var list = teachersDto.fromJsonList(readTeachersResult.docs);
      return Right(list);

    } on Exception {
      return Left(SaveTeacherError("Lista de professores vazio"));
    }
    catch(e){
      return Left(SaveTeacherError("Verifica a sua rede"));
    }
  }

}