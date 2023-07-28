

import 'package:cki/project/layers/core/errors/application_error.dart';
import 'package:cki/project/layers/domain/entities/teachers_entity/teachers_entity.dart';
import 'package:cki/project/layers/domain/usecases/read_teacher_list_usecase/read_teacher_list_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../repositories/read_teachers_repository/read_teachers_repository.dart';

class ReadTeachersUseCaseImp implements ReadTeachersUseCase{

  final ReadTeachersRepository _readTeachersRepository;
  ReadTeachersUseCaseImp(this._readTeachersRepository);

  @override
  Future<Either<ApplicationError, List<TeachersEntity>>> call() async{
    return await _readTeachersRepository();
  }

}