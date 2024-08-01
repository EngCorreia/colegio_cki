
import 'package:get_it/get_it.dart';
import 'package:remote/remote.dart';

import '../project/layers/services/login_service/login_service.dart';
final GetIt locator = GetIt.I;
void setupLocator(String? baseURL, {String? enviroment}) {
  //locator.registerLazySingleton(() => NavigationService());
  //locator.registerLazySingleton(() => BottomSheetService());
  //locator.registerLazySingleton(() => DialogService());
  //locator.registerLazySingleton(() => SnackbarService());
  //locator.registerLazySingleton(() => StartupViewModel());
  locator.registerLazySingleton(() => AuthenticationServe());

  //coreLocator();
  //loginLocator();


  //CORE
  if (enviroment == 'dev' || enviroment == 'prd') {
    locator.registerLazySingleton<IRemote>(() => RemoteImplementation(baseURL!));
    //locator.registerLazySingleton<ILocalDatabase>(() => LocalDatabaseImplementation(locator()));
    //locator.registerLazySingleton<ILocalStorage>(() => LocalStorageImplementation());
  }
}
