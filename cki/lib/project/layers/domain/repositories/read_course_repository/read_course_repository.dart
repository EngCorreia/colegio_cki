

import 'package:dartz/dartz.dart';

import '../../entities/courses_entity/coures_entitiy.dart';

abstract class ReadCourseRepository{
  Future<Either<Exception,List<Course>>> call();
}