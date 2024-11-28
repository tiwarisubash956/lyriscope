import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithEmailPassword.dart';
import 'package:lyriscope/Features/Auth/Domain/UseCase/SignInWithGoogle.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Signinwithgoogle signinwithgoogle;
  final Signinwithemailpassword signinwithemailpassword;
  AuthBloc(
      {required this.signinwithgoogle, required this.signinwithemailpassword})
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
          emit(AuthErrorState(Message: e.toString()));
        }
      }
    });
  }
}
