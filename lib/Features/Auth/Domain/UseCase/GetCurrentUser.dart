import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Core/Use_Cases/Usecase.dart';
import 'package:lyriscope/Features/Auth/Domain/Repository/AuthRepo.dart';

class GetCurrentUser implements Usecase<User?, GetCurrentUserPramas> {
  final AuthRepository authRepository;

  GetCurrentUser({required this.authRepository});
  @override
  Future<Either<Failure, User?>> call(GetCurrentUserPramas params) async {
    return await authRepository.getcurrentUser();
  }
}

class GetCurrentUserPramas {}
