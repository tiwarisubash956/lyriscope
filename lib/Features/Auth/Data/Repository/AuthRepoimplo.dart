import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Features/Auth/Data/AuthDataSource/AuthDataSource.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';

class Authrepoimplo implements AuthRepository {
  final AuthDataSource authDataSource;

  Authrepoimplo({required this.authDataSource});
  @override
  Future<Either<Failure, User?>> signInWithGoogle() async {
    try {
      final result = await authDataSource.signInWithGoogle();
      return right(result);
    } catch (e) {
      throw left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> loginWithEmailPassword(
      String email, String password) async {
    try {
      final result =
          await authDataSource.loginWithEmailPassword(email, password);
      return right(result);
    } catch (e) {
      throw left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> signupWithEmailPassword(
      String email, String password) async {
    try {
      final result =
          await authDataSource.signUpWithEmailPassword(email, password);
      return right(result);
    } catch (e) {
      throw left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getcurrentUser() async {
    try {
      final result = await authDataSource.getcurrentUser();
      return right(result);
    } catch (e) {
      throw left(ServerFailure(message: e.toString()));
    }
  }
}
