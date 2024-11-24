import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lyriscope/Core/app_export.dart';

abstract class AuthDataSource {
  Future<User?> signInWithGoogle();
}

class AuthDataSourceimp implements AuthDataSource {
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
}
