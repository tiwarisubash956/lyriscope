// ignore: file_names
// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Domain/UseCase/UploadBook.dart';

abstract class Adminhomedatasource {
  Future<void> uploadBook(UploadBookparamas bookDetail);
}

class Adminhomedatasourceimpl implements Adminhomedatasource {
  final FirebaseStorage firebaseStorage;
  final FirebaseFirestore firebaseFirestore;

  Adminhomedatasourceimpl(
      {required this.firebaseFirestore, required this.firebaseStorage});

  @override
  Future<void> uploadBook(UploadBookparamas bookDetail) async {
    try {
      String filename = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref('books/$filename.pdf');

      UploadTask uploadTask = storageRef.putFile(bookDetail.bookpdf!);
      TaskSnapshot snapshot = await uploadTask;
      String pdfurl = await snapshot.ref.getDownloadURL();

      await firebaseFirestore.collection('books').add({
        'title': bookDetail.bookName,
        'author': bookDetail.authorName,
        'pdf': pdfurl,
        'timestamp': FieldValue.serverTimestamp(),
        'coverimage':bookDetail.coverimage
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
