

import 'package:dartz/dartz.dart';

import '../../../core/errors/application_error.dart';
import '../../entities/teachers_entity/teachers_entity.dart';

abstract class ReadTeachersUseCase{
  Future<Either<ApplicationError,List<TeachersEntity>>> call();
}