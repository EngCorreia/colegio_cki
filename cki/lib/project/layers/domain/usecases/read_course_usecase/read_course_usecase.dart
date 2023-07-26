
import 'package:dartz/dartz.dart';

import '../../entities/courses_entity/coures_entitiy.dart';

abstract class ReadCourseUseCase{
  Future<Either<Exception,List<Course>>> call();
}