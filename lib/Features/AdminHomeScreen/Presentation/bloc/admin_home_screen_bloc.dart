import 'dart:io';

import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/UseCase/UploadBook.dart';

part 'admin_home_screen_event.dart';
part 'admin_home_screen_state.dart';

class AdminHomeScreenBloc
    extends Bloc<AdminHomeScreenEvent, AdminHomeScreenState> {
  final Uploadbook uploadbook;
  AdminHomeScreenBloc({required this.uploadbook})
      : super(AdminHomeScreenInitial()) {
    on<AdminHomeScreenEvent>((event, emit) async {
      if (event is UploadBookEvent) {
        try {
          final failureOrSuccess = await uploadbook(UploadBookparamas(
              authorName: event.authorName,
              genre: event.genre,
              bookName: event.title,
              bookpdf: event.bookpdf,
              coverimage: event.coverimage));
          failureOrSuccess.fold(
              (failure) => emit(AdminHomeScreenErrorState(
                  message: (failure as ServerFailure).message)),
              (success) => emit(BookUploadedState()));
        } catch (e) {
          emit(AdminHomeScreenErrorState(message: "Error: ${e.toString()}"));
        }
      }
    });
  }
}
