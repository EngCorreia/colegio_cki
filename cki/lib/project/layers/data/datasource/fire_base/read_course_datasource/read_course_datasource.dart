

import 'package:dartz/dartz.dart';

import '../../../../domain/entities/courses_entity/coures_entitiy.dart';

abstract class ReadCourseDataSource{
  Future<Either<Exception,List<Course>>> call();
}