import 'package:cki/project/layers/core/errors/application_error.dart';

import 'package:cki/project/layers/domain/entities/logim_param/login_param.dart';

import 'package:cki/project/layers/domain/entities/user_auth-entity/user_auth_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repositories/login_repository/login_repository.dart';

class LoginRepositoryImp implements LoginRepository{


  @override
  Future<Either<ApplicationError, UserAuthEntity>> call({LoginParam? param}) {
    throw UnimplementedError();
  }

}