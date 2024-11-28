import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lyriscope/Features/Auth/Data/AuthDataSource/AuthDataSource.dart';
import 'package:lyriscope/Features/Auth/Data/Repository/AuthRepoimplo.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithEmailPassword.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithGoogle.dart';
import 'package:lyriscope/Features/Auth/Presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(
      () => AuthBloc(signinwithgoogle: sl(), signinwithemailpassword: sl()));

  sl.registerFactory(() => Signinwithgoogle(authRepository: sl()));
  sl.registerFactory(() => Signinwithemailpassword(authRepository: sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => Authrepoimplo(authDataSource: sl()));

  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceimp(firebaseAuth: sl()));

  sl.registerLazySingleton<Authrepoimplo>(
      () => Authrepoimplo(authDataSource: sl()));

  sl.registerLazySingleton<AuthDataSourceimp>(
      () => AuthDataSourceimp(firebaseAuth: sl()));
}
