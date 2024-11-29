part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthErrorState extends AuthState {
  final String Message;

  const AuthErrorState({required this.Message});
}

class SigninwithgoogleSuccessState extends AuthState {}

class AuthenticatedState extends AuthState {}

class LoginWithEmailPasswordSuccessState extends AuthState {}

class GetCurrentUserState extends AuthState {
  final User? user;

  const GetCurrentUserState({required this.user});
}
