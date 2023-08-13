import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../core/errors/save_student_error.dart';
import '../../../domain/repositories/create_new_student_repository/create_new_student_repository.dart';
import '../../datasource/fire_base/save_new_student_datasource/save_new_student_datasource.dart';


class CreateNewStudentRepositoryImp implements CreateNewStudentRepository {

  final SaveNewStudentDataSource _saveNewStudentDataSource;
  CreateNewStudentRepositoryImp(this._saveNewStudentDataSource);

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity,required int number}) async{
   return await _saveNewStudentDataSource(studentDataEntity: studentDataEntity,number: number);
  }

}