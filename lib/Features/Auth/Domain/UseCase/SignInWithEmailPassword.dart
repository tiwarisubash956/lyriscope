import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Core/Use_Cases/Usecase.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';

class Signinwithemailpassword
    implements Usecase<User?, SignInWithEmailPasswordParamas> {
  final AuthRepository authRepository;

  Signinwithemailpassword({required this.authRepository});
  @override
  Future<Either<Failure, User?>> call(SignInWithEmailPasswordParamas params) {
    return authRepository.loginWithEmailPassword(
        params.email, params.password);
  }
}

class SignInWithEmailPasswordParamas {
  final String email;
  final String password;

  SignInWithEmailPasswordParamas({required this.email, required this.password});
}
