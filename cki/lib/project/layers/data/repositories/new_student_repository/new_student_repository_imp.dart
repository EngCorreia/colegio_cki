import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../core/errors/save_student_error.dart';
import '../../../domain/repositories/new_student_repository/new_student_repository.dart';
import '../../datasource/fire_base/seve_new_student/save_new_student.dart';

class NewStudentRepositoryImp implements NewStudentRepository {

  final NewStudentDataSource _newStudentDataSource;
  NewStudentRepositoryImp(this._newStudentDataSource);

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity}) async{
   return await _newStudentDataSource(studentDataEntity: studentDataEntity);
  }

}