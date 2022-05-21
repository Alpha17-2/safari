import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImage {
  final String? imageLoaction;
  final File? file;
  UploadImage({this.imageLoaction, this.file});

  Future<String> service() async {
    String downloadUrl = '';
    final Reference storageReference =
        FirebaseStorage.instance.ref().child(imageLoaction!);
    final UploadTask uploadTask = storageReference.putFile(file!);
    final TaskSnapshot taskSnapshot = await uploadTask;
    await taskSnapshot.ref
        .getDownloadURL()
        .then((value) => downloadUrl = value);
    return downloadUrl;
  }
}