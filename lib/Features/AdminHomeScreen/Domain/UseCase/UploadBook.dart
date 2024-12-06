// ignore_for_file: file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Core/Use_Cases/Usecase.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/Repository/AdminHomeRepository.dart';

class Uploadbook implements Usecase<void, UploadBookparamas> {
  final Adminhomerepository adminhomerepository;

  Uploadbook({required this.adminhomerepository});
  @override
  Future<Either<Failure, void>> call(UploadBookparamas params) {
    return adminhomerepository.uploadBook(params);
  }
}

class UploadBookparamas {
  final String authorName;
  final String genre;
  final String bookName;
  final File? bookpdf;
  final File? coverimage;

  UploadBookparamas(
      {required this.authorName,
      required this.genre,
      required this.bookName,
      required this.bookpdf,
      required this.coverimage});
}
