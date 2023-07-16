import 'package:dartz/dartz.dart';import '../../../core/errors/save_teacher_error.dart';

import '../../entities/teachers_entity/teachers_entity.dart';
import '../../repositories/create_new_teacher_repository/create_new_teacher_repository.dart';
import 'create_new_teachers_usecase.dart';

class CreateNewTeachersUseCaseImp implements CreateNewTeachersUseCase{

  final CreateNewTeachersRepository _createNewTeachersRepository;
  CreateNewTeachersUseCaseImp(this._createNewTeachersRepository);

  @override
  Future<Either<SaveTeacherError, bool>> call({required TeachersEntity teachersEntity}) async{
    return await _createNewTeachersRepository(teachersEntity: teachersEntity);
  }

}