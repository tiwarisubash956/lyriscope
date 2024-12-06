part of 'admin_home_screen_bloc.dart';

sealed class AdminHomeScreenEvent extends Equatable {
  const AdminHomeScreenEvent();

  @override
  List<Object> get props => [];
}

class UploadBookEvent extends AdminHomeScreenEvent {
  final String authorName;
  final String title;
  final String genre;
  final File? bookpdf;
  final File? coverimage;

  const UploadBookEvent(
      {required this.authorName,
      required this.title,
      required this.genre,
      required this.bookpdf,
      required this.coverimage});
}
