import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../core/errors/save_student_error.dart';
import '../../repositories/new_student_repository/new_student_repository.dart';
import 'new_student_usecase.dart';

class NewStudentUseCaseImp implements NewStudentUseCase{

  final NewStudentRepository _newStudentRepository;
  NewStudentUseCaseImp(this._newStudentRepository);

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity}) async{
    return await _newStudentRepository(studentDataEntity: studentDataEntity);
  }
}