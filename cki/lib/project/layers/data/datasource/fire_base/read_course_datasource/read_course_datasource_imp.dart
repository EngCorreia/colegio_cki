import 'dart:developer';

import 'package:cki/project/layers/data/datasource/fire_base/read_course_datasource/read_course_datasource.dart';
import 'package:cki/project/layers/domain/entities/courses_entity/coures_entitiy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../dto/course_dto/course_dto.dart';

class ReadCourseDataSourceImp implements ReadCourseDataSource{

  CourseDto courseDto = CourseDto();
  @override
  Future<Either<Exception, List<Course>>> call() async{

    try{
      var readCourseResult = await FirebaseFirestore.instance.collection("colegios").doc("kalabo_internacional")
          .collection("2023_a_2024").doc("cki_2023").collection("cursos").orderBy("id").get();
      var list = courseDto.fromJsonList(readCourseResult.docs);
      return Right(list);
    } on Exception {
      return Left(Exception());
    }
    catch(e){
      return Left(Exception());
    }
  }

  }
