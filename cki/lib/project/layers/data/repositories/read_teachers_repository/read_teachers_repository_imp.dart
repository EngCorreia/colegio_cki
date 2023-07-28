

import 'package:cki/project/layers/core/errors/application_error.dart';

import 'package:cki/project/layers/domain/entities/teachers_entity/teachers_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repositories/read_teachers_repository/read_teachers_repository.dart';
import '../../datasource/fire_base/read_teachers_datasource/read_teachers_datasource.dart';

class ReadTeachersRepositoryImp implements ReadTeachersRepository{

  final ReadTeachersDataSource _readTeachersDataSource;
  ReadTeachersRepositoryImp(this._readTeachersDataSource);

  @override
  Future<Either<ApplicationError, List<TeachersEntity>>> call() async{
   return await _readTeachersDataSource();
  }

}