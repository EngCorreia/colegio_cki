

import 'package:get_it/get_it.dart';

import '../../../data/datasource/fire_base/read_teachers_datasource/read_teachers_datasource.dart';
import '../../../data/datasource/fire_base/read_teachers_datasource/read_teachers_datasource_imp.dart';
import '../../../data/repositories/read_teachers_repository/read_teachers_repository_imp.dart';
import '../../../domain/repositories/read_teachers_repository/read_teachers_repository.dart';
import '../../../domain/usecases/read_teacher_list_usecase/read_teacher_list_usecase.dart';
import '../../../domain/usecases/read_teacher_list_usecase/read_teacher_list_usecase_im.dart';
import '../../../presentation/controllers/read_teachers_controller/read_teachers_controller.dart';

class ReadTeachersInject{

  static void init(){
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<ReadTeachersDataSource>(()=> ReadTeachersDataSourceImp());

    //repository
    getIt.registerLazySingleton<ReadTeachersRepository>(() => ReadTeachersRepositoryImp(getIt()));

    //usecase
    getIt.registerLazySingleton<ReadTeachersUseCase>(() => ReadTeachersUseCaseImp(getIt()));


    //controller
    getIt.registerFactory<ReadTeachersController>(() => ReadTeachersController(getIt()));

  }
}