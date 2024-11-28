import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Core/Use_Cases/Usecase.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';

class Signinwithgoogle implements Usecase<User?, SigninwithgooglePramas> {
  final AuthRepository authRepository;

  Signinwithgoogle({required this.authRepository});
  @override
  Future<Either<Failure, User?>> call(SigninwithgooglePramas params) async {
    return await authRepository.signInWithGoogle();
  }
}

class SigninwithgooglePramas {}
