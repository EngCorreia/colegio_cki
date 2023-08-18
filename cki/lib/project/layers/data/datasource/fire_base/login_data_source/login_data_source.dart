

import 'package:dartz/dartz.dart';

import '../../../../core/errors/application_error.dart';
import '../../../../domain/entities/logim_param/login_param.dart';
import '../../../../domain/entities/user_auth-entity/user_auth_entity.dart';

abstract class LoginDataSource{
  Future<Either<ApplicationError,UserAuthEntity>> call({LoginParam? param});
}