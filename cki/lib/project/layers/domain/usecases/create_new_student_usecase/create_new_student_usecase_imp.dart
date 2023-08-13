import 'package:cki/project/layers/domain/entities/student_entity/student_data_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../core/errors/save_student_error.dart';
import '../../repositories/create_new_student_repository/create_new_student_repository.dart';
import 'create_new_student_usecase.dart';

class CreateNewStudentUseCaseImp implements CreateNewStudentUseCase{

  final CreateNewStudentRepository _createNewStudentRepository;
  CreateNewStudentUseCaseImp(this._createNewStudentRepository);

  @override
  Future<Either<SaveStudentError, bool>> call({required StudentDataEntity studentDataEntity,required int number}) async{
    return await _createNewStudentRepository(studentDataEntity: studentDataEntity,number: number);
  }
}