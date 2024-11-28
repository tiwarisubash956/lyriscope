import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Core/Use_Cases/Usecase.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';

class SignUpwithemailpassword
    implements Usecase<User?, SignUpWithEmailPasswordParamas> {
  final AuthRepository authRepository;

  SignUpwithemailpassword({required this.authRepository});
  @override
  Future<Either<Failure, User?>> call(SignUpWithEmailPasswordParamas params) {
    return authRepository.signupWithEmailPassword(
        params.email, params.password);
  }
}

class SignUpWithEmailPasswordParamas {
  final String email;
  final String password;

  SignUpWithEmailPasswordParamas({required this.email, required this.password});
}
