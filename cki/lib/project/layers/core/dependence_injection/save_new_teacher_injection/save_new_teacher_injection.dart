import '../../../data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource.dart';
import '../../../data/datasource/fire_base/save_new_student_datasource/save_new_student_datasource_imp.dart';
import '../../../data/datasource/fire_base/save_new_teacher_datasource/save_new_teacher_datasource.dart';
import '../../../data/datasource/fire_base/save_new_teacher_datasource/save_new_teacher_datasource_imp.dart';
import '../../../data/repositories/create_new_student_repository/create_new_student_repository_imp.dart';
import '../../../data/repositories/create_new_teacher_repository/create_new_teacher_repository_imp.dart';
import '../../../domain/repositories/create_new_student_repository/create_new_student_repository.dart';
import '../../../domain/repositories/create_new_teacher_repository/create_new_teacher_repository.dart';
import '../../../domain/usecases/create_new_student_usecase/create_new_student_usecase.dart';
import '../../../domain/usecases/create_new_student_usecase/create_new_student_usecase_imp.dart';
import '../../../domain/usecases/create_new_teachers_usecase/create_new_teachers_usecase.dart';
import '../../../domain/usecases/create_new_teachers_usecase/create_new_teachers_usecase_imp.dart';
import '../../../presentation/controllers/save_new_student_controller/save_new_student_controller.dart';
import 'package:get_it/get_it.dart';

import '../../../presentation/controllers/save_new_teacher_controller/save_new_teacher_controller.dart';

class SaveTeacherInject{

  static void init(){
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<CreateNewTeachersDataSource>(()=> CreateNewTeachersDataSourceImp());

    //repository
    getIt.registerLazySingleton<CreateNewTeachersRepository>(() => CreateNewTeachersRepositoryImp(getIt()));

    //usecase
    getIt.registerLazySingleton<CreateNewTeachersUseCase>(() => CreateNewTeachersUseCaseImp(getIt()));

    //controller
    getIt.registerFactory<SaveNewTeacherController>(() => SaveNewTeacherController(getIt()));

  }
}