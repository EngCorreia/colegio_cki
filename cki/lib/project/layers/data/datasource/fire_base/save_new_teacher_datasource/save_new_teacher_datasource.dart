import 'package:dartz/dartz.dart';

import '../../../../core/errors/save_teacher_error.dart';
import '../../../../domain/entities/teachers_entity/teachers_entity.dart';

abstract class CreateNewTeachersDataSource{
  Future<Either<SaveTeacherError,bool>> call({required TeachersEntity teachersEntity});
}