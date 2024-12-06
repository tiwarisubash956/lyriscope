import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Data/AdminRepoimpl.dart/AdminRepoimpl.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Data/DataSource/AdminHomeDataSource.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/Repository/AdminHomeRepository.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/UseCase/UploadBook.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Presentation/bloc/admin_home_screen_bloc.dart';
import 'package:lyriscope/Features/Auth/Data/AuthDataSource/AuthDataSource.dart';
import 'package:lyriscope/Features/Auth/Data/Repository/AuthRepoimplo.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/GetCurrentUser.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithEmailPassword.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithGoogle.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignUpWithEmailPassword.dart';
import 'package:lyriscope/Features/Auth/Presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
    sl.registerLazySingleton(() => FirebaseStorage.instance);


  sl.registerLazySingleton(() => AuthBloc(
      getCurrentUser: sl(),
      signinwithgoogle: sl(),
      signinwithemailpassword: sl(),
      signUpwithemailpassword: sl()));

  sl.registerLazySingleton(() => AdminHomeScreenBloc(uploadbook: sl()));

  sl.registerFactory(() => Signinwithgoogle(authRepository: sl()));
  sl.registerFactory(() => Signinwithemailpassword(authRepository: sl()));
  sl.registerFactory(() => SignUpwithemailpassword(authRepository: sl()));
  sl.registerFactory(() => GetCurrentUser(authRepository: sl()));

  sl.registerFactory(() => Uploadbook(adminhomerepository: sl()));


        //Auth Bloc AND Repo register


  sl.registerLazySingleton<AuthRepository>(
      () => Authrepoimplo(authDataSource: sl()));

  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceimp(firebaseAuth: sl()));

  sl.registerLazySingleton<Authrepoimplo>(
      () => Authrepoimplo(authDataSource: sl()));

  sl.registerLazySingleton<AuthDataSourceimp>(
      () => AuthDataSourceimp(firebaseAuth: sl()));

      //Admin Bloc AND Repo register

  sl.registerLazySingleton<Adminhomerepository>(
      () => AdminRepoimpl(adminhomedatasource: sl()));

  sl.registerLazySingleton<Adminhomedatasource>(() =>
      Adminhomedatasourceimpl(firebaseFirestore: sl(), firebaseStorage: sl()));

  sl.registerLazySingleton<AdminRepoimpl>(
      () => AdminRepoimpl(adminhomedatasource: sl()));

  sl.registerLazySingleton<Adminhomedatasourceimpl>(() =>
      Adminhomedatasourceimpl(firebaseFirestore: sl(), firebaseStorage: sl()));
}
