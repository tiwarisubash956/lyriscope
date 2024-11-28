import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lyriscope/Core/app_export.dart';

abstract class AuthDataSource {
  Future<User?> signInWithGoogle();
  Future<User?> loginWithEmailPassword(String email, String password);
  Future<User?> signUpWithEmailPassword(String email, String password);
}

class AuthDataSourceimp implements AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSourceimp({required this.firebaseAuth});

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // ignore: avoid_returning_null_for_void
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential usercredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return usercredential.user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      // ignore: non_constant_identifier_names
      final UserCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserCredential.user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      // ignore: non_constant_identifier_names
      final UserCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserCredential.user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
