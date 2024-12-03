import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/GetCurrentUser.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithEmailPassword.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithGoogle.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignUpWithEmailPassword.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Signinwithgoogle signinwithgoogle;
  final Signinwithemailpassword signinwithemailpassword;
  final SignUpwithemailpassword signUpwithemailpassword;
  final GetCurrentUser getCurrentUser;
  AuthBloc(
      {required this.getCurrentUser,
      required this.signUpwithemailpassword,
      required this.signinwithgoogle,
      required this.signinwithemailpassword})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SigninwithgoogleEvent) {
        try {
          final failureOrSuccess =
              await signinwithgoogle(SigninwithgooglePramas());
          failureOrSuccess.fold(
              (failure) => emit(
                  AuthErrorState(Message: (failure as ServerFailure).message)),
              (success) => emit(AuthenticatedState()));
        } catch (e) {
          emit(AuthErrorState(Message: e.toString()));
        }
      }
      if (event is LoginWithEmailPasswordEvent) {
        try {
          final failureOrSuccess = await signinwithemailpassword(
              SignInWithEmailPasswordParamas(
                  email: event.email, password: event.password));
          failureOrSuccess.fold(
              (failure) => emit(
                  AuthErrorState(Message: (failure as ServerFailure).message)),
              (success) => emit(AuthenticatedState()));
        } catch (e) {
          emit(const AuthErrorState(
              Message: "UnAuthorized User or Password or email are incorrect"));
        }
      }
      if (event is SignUpWithEmailPasswordEvent) {
        try {
          final failureOrSuccess = await signUpwithemailpassword(
              SignUpWithEmailPasswordParamas(
                  email: event.email, password: event.password));

          failureOrSuccess.fold(
              (failure) => emit(
                  AuthErrorState(Message: (failure as ServerFailure).message)),
              (success) => emit(AuthenticatedState()));
        } catch (e) {
          emit(AuthErrorState(Message: e.toString()));
        }
      }

      if (event is GetCurrentUserEvent) {
        emit(AuthLoadingState());

        try {
          final failureOrSuccess = await getCurrentUser(GetCurrentUserPramas());

          // Wait for the delay to complete

          failureOrSuccess.fold(
              (failure) => emit(
                  AuthErrorState(Message: (failure as ServerFailure).message)),
              (success) => emit(GetCurrentUserState(user: success)));
        } catch (e) {
          emit(const AuthErrorState(
              Message: "Error Occurs while fetching data"));
        }
      }
    });
  }
}
