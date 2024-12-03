part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SigninwithgoogleEvent extends AuthEvent {}

class LoginWithEmailPasswordEvent extends AuthEvent {
  final String password;
  final String email;
  const LoginWithEmailPasswordEvent(
      {required this.password, required this.email});

  @override
  List<Object> get props => [email, password];
}

class AuthLoadingEvent extends AuthEvent {}

class SignUpWithEmailPasswordEvent extends AuthEvent {
  final String password;
  final String email;
  const SignUpWithEmailPasswordEvent(
      {required this.password, required this.email});

  @override
  List<Object> get props => [email, password];
}

class ForgetPasswordEvent extends AuthEvent {
  final String email;

  const ForgetPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class GetCurrentUserEvent extends AuthEvent {}
