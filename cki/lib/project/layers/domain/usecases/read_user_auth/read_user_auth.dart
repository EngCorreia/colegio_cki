
import 'package:dartz/dartz.dart';

import '../../../core/errors/application_error.dart';
import '../../entities/user_auth-entity/user_auth_entity.dart';


abstract class ReadUserAuthUseCase{
  Future<Either<ApplicationError,UserAuthEntity>> call();
}