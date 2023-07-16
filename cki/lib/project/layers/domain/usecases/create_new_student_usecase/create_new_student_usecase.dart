import 'package:dartz/dartz.dart';
import '../../../core/errors/save_student_error.dart';
import '../../entities/student_entity/student_data_entity.dart';

abstract class CreateNewStudentUseCase {
  Future<Either<SaveStudentError,bool>> call({required StudentDataEntity studentDataEntity});
}