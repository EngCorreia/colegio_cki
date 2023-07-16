import 'package:cki/project/layers/presentation/ui_widgets/teachers/list_of_teachers/read_teachers.dart';

import 'package:dartz/dartz.dart';

import '../../../core/errors/save_teacher_error.dart';
import '../../../domain/entities/teachers_entity/teachers_entity.dart';
import '../../../domain/repositories/create_new_teacher_repository/create_new_teacher_repository.dart';
import '../../datasource/fire_base/save_new_teacher_datasource/save_new_teacher_datasource.dart';

class CreateNewTeachersRepositoryImp implements CreateNewTeachersRepository{

  final CreateNewTeachersDataSource _createNewTeachersDataSource;
  CreateNewTeachersRepositoryImp(this._createNewTeachersDataSource);

  @override
  Future<Either<SaveTeacherError, bool>> call({required TeachersEntity teachersEntity}) async{
    return await _createNewTeachersDataSource(teachersEntity: teachersEntity);
  }

}