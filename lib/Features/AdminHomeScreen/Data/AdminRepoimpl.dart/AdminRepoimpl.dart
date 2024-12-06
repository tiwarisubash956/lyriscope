// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:lyriscope/Core/Error/failures.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Data/DataSource/AdminHomeDataSource.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/Repository/AdminHomeRepository.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/UseCase/UploadBook.dart';

class AdminRepoimpl implements Adminhomerepository {
  final Adminhomedatasource adminhomedatasource;

  AdminRepoimpl({required this.adminhomedatasource});
  @override
  Future<Either<Failure, void>> uploadBook(UploadBookparamas bookDetail) async {
    try {
      final result = await adminhomedatasource.uploadBook(bookDetail);
      return right(result);
    } catch (e) {
      throw left(ServerFailure(message: e.toString()));
    }
  }
}
