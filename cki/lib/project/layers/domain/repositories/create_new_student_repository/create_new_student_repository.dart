import 'package:dartz/dartz.dart';

import '../../../core/errors/save_student_error.dart';
import '../../entities/student_entity/student_data_entity.dart';

abstract class CreateNewStudentRepository {
  Future<Either<SaveStudentError,bool>> call({required StudentDataEntity studentDataEntity,required int number,required String classe});
}