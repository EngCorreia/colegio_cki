

import 'package:get_it/get_it.dart';

import '../../../data/datasource/fire_base/login_data_source/login_data_source.dart';
import '../../../data/datasource/fire_base/login_data_source/login_data_source_imp.dart';
import '../../../data/repositories/login_repository/login_repository_imp.dart';
import '../../../domain/repositories/login_repository/login_repository.dart';
import '../../../domain/usecases/login_usecase/login_usecase.dart';
import '../../../domain/usecases/login_usecase/login_usecase_imp.dart';
import '../../../presentation/controllers/login_controller/login_controller.dart';

class LoginInject{

  static void init(){
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<LoginDataSource>(()=> LoginDataSourceImp());

    //repository
    getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImp(getIt()));

    //usecase
    getIt.registerLazySingleton<Login>(() => LoginUseCaseImp(getIt()));

    //controller
    getIt.registerFactory<LoginController>(() => LoginController(getIt()));

  }
}