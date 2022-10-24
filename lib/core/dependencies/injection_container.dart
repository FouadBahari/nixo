import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nixo/core/network/network_infos.dart';
import 'package:nixo/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nixo/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';
import 'package:nixo/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/facebook_auth_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/get_current_id_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/google_auth_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/is_signin_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/signin_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/signout_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/signup_usecase.dart';
import 'package:nixo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nixo/features/auth/presentation/cubit/credential_cubit.dart';
import 'package:nixo/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:nixo/features/onboarding/data/repositories/onboarding_repo_impl.dart';
import 'package:nixo/features/onboarding/domain/repositories/on_boarding_repo.dart';
import 'package:nixo/features/onboarding/domain/usecases/isfirst_time_usecase.dart';
import 'package:nixo/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<CredentialCubit>(
    () => CredentialCubit(
      forgotPasswordUseCase: sl(),
      getCreateCurrentUserUseCase: sl(),
      googleSignInUseCase: sl(),
      signInUseCase: sl(),
      signUpUseCase: sl(),
      facebookAuthUseCase: sl(),
    ),
  );

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      getCurrentUIDUseCase: sl(),
      isSignInUseCase: sl(),
      signOutUseCase: sl(),
    ),
  );

  sl.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(isFirstTimeUsecase: sl()),
  );

  // Use cases
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<FacebookAuthUseCase>(
      () => FacebookAuthUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<CreateUserUseCase>(
      () => CreateUserUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(authRepo: sl.call()));
  sl.registerLazySingleton<IsFirstTimeUsecase>(
      () => IsFirstTimeUsecase(onBoardingRepo: sl.call()));

  // Repository
  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfos: sl()));
  sl.registerLazySingleton<OnBoardingRepo>(
      () => OnBoardingRepoImpl(onBoardingLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      auth: sl(),
      fireStore: sl(),
      googleSignIn: sl(),
      facebookauth: sl(),
    ),
  );
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
    () => OnBoardingLocalDataSourceImpl(prefs: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfos>(
      () => NetworkInfosImpl(connectionChecker: sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookAuth facebookauth = FacebookAuth.instance;
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);
  sl.registerLazySingleton(() => facebookauth);
  sl.registerLazySingleton(() => prefs);
}
