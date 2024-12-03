part of 'admin_home_screen_bloc.dart';

sealed class AdminHomeScreenState extends Equatable {
  const AdminHomeScreenState();

  @override
  List<Object> get props => [];
}

final class AdminHomeScreenInitial extends AdminHomeScreenState {}

class BookUploadedState extends AdminHomeScreenState {}

class AdminHomeScreenErrorState extends AdminHomeScreenState {
  final String message;

  const AdminHomeScreenErrorState({required this.message});
}
