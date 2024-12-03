

// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/UseCase/UploadBook.dart';

abstract  class Adminhomerepository {

  Future<Either<Failure,void>> uploadBook(UploadBookparamas bookDetail);
}