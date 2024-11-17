import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyriscope/Core/Utils/pref_utils.dart';
import 'package:lyriscope/Core/app_export.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState) {
    on<ThemeChangeEvent>(_changeTheme);
  }

  _changeTheme(
    ThemeChangeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(state.copyWith(themeType: event.themeType));
  }
}