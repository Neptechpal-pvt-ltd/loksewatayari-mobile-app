// import 'package:get_it/get_it.dart';
// import 'package:loksewa/config/app_config.dart';
// import 'package:loksewa/repositories/auth_repo.dart';

// GetIt locator = GetIt.asNewInstance();

// void setupLocator({required Flavor flavor}) {
//   locator.registerLazySingleton(() => AuthRepo());
//     locator.registerLazySingleton<IConfig>(
//       () => flavor == Flavor.PROD
//           ? ProdConfig()
//           : flavor == Flavor.DEV
//               ? DevConfig()
//               : LocalConfig());

//   locator.registerFactory(() => LoginModel());

// }
