import 'package:dartz/dartz.dart';

import '../../../core/errors/save_teacher_error.dart';
import '../../../presentation/ui_widgets/teachers/list_of_teachers/read_teachers.dart';
import '../../entities/teachers_entity/teachers_entity.dart';

abstract class CreateNewTeachersUseCase{
  Future<Either<SaveTeacherError,bool>> call({required TeachersEntity teachersEntity});
}