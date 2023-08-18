

import 'package:cki/project/layers/core/errors/application_error.dart';
import 'package:cki/project/layers/data/datasource/fire_base/login_data_source/login_data_source.dart';
import 'package:cki/project/layers/domain/entities/logim_param/login_param.dart';
import 'package:cki/project/layers/domain/entities/user_auth-entity/user_auth_entity.dart';
import 'package:dartz/dartz.dart';

class LoginDataSourceImp implements LoginDataSource{

  @override
  Future<Either<ApplicationError, UserAuthEntity>> call({LoginParam? param}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}