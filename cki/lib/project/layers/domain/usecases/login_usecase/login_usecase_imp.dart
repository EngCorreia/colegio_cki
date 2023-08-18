
import 'package:cki/project/layers/core/errors/application_error.dart';
import 'package:cki/project/layers/domain/entities/logim_param/login_param.dart';
import 'package:cki/project/layers/domain/entities/user_auth-entity/user_auth_entity.dart';
import 'package:dartz/dartz.dart';

import '../../repositories/login_repository/login_repository.dart';
import 'login_usecase.dart';

class LoginUseCaseImp implements Login{
  final LoginRepository _loginRepository;
  LoginUseCaseImp(this._loginRepository);

  @override
  Future<Either<ApplicationError, UserAuthEntity>> call({LoginParam? param}) async => await _loginRepository(param: param);

}