import 'package:dartz/dartz.dart';
import '../../../../core/errors/save_student_error.dart';
import '../../../../domain/entities/student_entity/student_data_entity.dart';

abstract class SaveNewStudentDataSource {
  Future<Either<SaveStudentError,bool>> call({required StudentDataEntity studentDataEntity});
}