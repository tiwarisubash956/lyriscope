import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/Error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> signInWithGoogle();
  Future<Either<Failure,User?>> loginWithEmailPassword(String email,String password);
  }
