import 'package:cki/project/layers/core/errors/application_error.dart';

import 'package:cki/project/layers/domain/entities/logim_param/login_param.dart';

import 'package:cki/project/layers/domain/entities/user_auth-entity/user_auth_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repositories/login_repository/login_repository.dart';
import '../../datasource/fire_base/login_data_source/login_data_source.dart';

class LoginRepositoryImp implements LoginRepository{

  final LoginDataSource _loginDataSource;
  LoginRepositoryImp(this._loginDataSource);

  @override
  Future<Either<ApplicationError, UserAuthEntity>> call({LoginParam? param}) async {
    return await _loginDataSource(param: param);
  }

}