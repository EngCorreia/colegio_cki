

import 'package:get_it/get_it.dart';

import '../../../data/datasource/fire_base/read_course_datasource/read_course_datasource.dart';
import '../../../data/datasource/fire_base/read_course_datasource/read_course_datasource_imp.dart';
import '../../../data/repositories/read_course_repository/read_course_repository_imp.dart';
import '../../../domain/repositories/read_course_repository/read_course_repository.dart';
import '../../../domain/usecases/read_course_usecase/read_course_usecase.dart';
import '../../../domain/usecases/read_course_usecase/read_course_usecase_imp.dart';
import '../../../presentation/controllers/read_course_controller/read_course_controller.dart';
import '../../listeners/listener.dart';
import '../../listeners/listenner_classe.dart';

class ReadCourseInject{

  static void init(){
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<ReadCourseDataSource>(()=> ReadCourseDataSourceImp());

    //repository
    getIt.registerLazySingleton<ReadCourseRepository>(() => ReadCourseRepositoryImp(getIt()));

    //usecase
    getIt.registerLazySingleton<ReadCourseUseCase>(() => ReadCourseUseCaseImp(getIt()));

    //controller
    getIt.registerFactory<ReadCourseController>(() => ReadCourseController(getIt()));

  }
}