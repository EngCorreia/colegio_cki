

import 'package:dartz/dartz.dart';

import '../../../core/errors/application_error.dart';
import '../../entities/logim_param/login_param.dart';
import '../../entities/user_auth-entity/user_auth_entity.dart';

abstract class Login{
  Future<Either<ApplicationError,UserAuthEntity>> call({LoginParam? param});
}