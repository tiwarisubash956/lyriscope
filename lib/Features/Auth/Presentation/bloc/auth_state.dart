part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthErrorState extends AuthState {
  final String Message;

  AuthErrorState({required this.Message});
}

class SigninwithgoogleSuccessState extends AuthState {}

class AuthenticatedState extends AuthState {}

class LoginWithEmailPasswordSuccessState extends AuthState {}

class GetCurrentUserState extends AuthState {
  final User? user;

  GetCurrentUserState({required this.user});
}
