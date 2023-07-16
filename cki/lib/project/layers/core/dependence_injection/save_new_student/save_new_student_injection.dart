import '../../../data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource.dart';
import '../../../data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource_imp.dart';
import '../../../data/repositories/create_new_student_repository/create_new_student_repository_imp.dart';
import '../../../domain/repositories/create_new_student_repository/create_new_student_repository.dart';
import '../../../domain/usecases/create_new_student_usecase/create_new_student_usecase.dart';
import '../../../domain/usecases/create_new_student_usecase/create_new_student_usecase_imp.dart';
import '../../../presentation/controllers/save_new_student_controller/save_new_student_controller.dart';
import 'package:get_it/get_it.dart';

class SaveStudentInject{

  static void init(){
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<SaveNewStudentDataSource>(()=> SaveNewStudentDataSourceImp());

    //repository
    getIt.registerLazySingleton<CreateNewStudentRepository>(() => CreateNewStudentRepositoryImp(getIt()));

    //usecase
    getIt.registerLazySingleton<CreateNewStudentUseCase>(() => CreateNewStudentUseCaseImp(getIt()));

    //controller
    getIt.registerFactory<SaveNewStudentController>(() => SaveNewStudentController(getIt()));

  }
}