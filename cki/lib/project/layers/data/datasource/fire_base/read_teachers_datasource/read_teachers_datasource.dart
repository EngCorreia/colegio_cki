

import 'package:dartz/dartz.dart';

import '../../../../core/errors/application_error.dart';
import '../../../../domain/entities/teachers_entity/teachers_entity.dart';

abstract class ReadTeachersDataSource{
  Future<Either<ApplicationError,List<TeachersEntity>>> call();
}