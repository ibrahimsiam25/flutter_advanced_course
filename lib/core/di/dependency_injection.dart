import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

/// 🔹 Lazy Singleton: The object is created only once when needed.
/// 🔹 It retains the same instance throughout the app's lifecycle.
/// 🔹 Suitable for services that need to maintain state (e.g., API, Database).
/// ⚠️ Issue: If used with Cubit, closing the Cubit instance will cause an error 
///    because GetIt will still return the closed instance when requested again.


/// 🔹 Factory: A new object is created every time it is requested.
/// 🔹 Does not retain any state (Stateless).
/// 🔹 Suitable for classes that need a fresh instance each time (e.g., ViewModel, Bloc).
  
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
