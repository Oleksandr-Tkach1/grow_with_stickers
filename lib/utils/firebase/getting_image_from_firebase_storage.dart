import 'package:firebase_storage/firebase_storage.dart';

class GettingImageFromFirebaseStorage{
  static Future<String> getImageFromStorage(String imagePath) async {
    final FirebaseStorage _fs =  FirebaseStorage.instanceFor(bucket: "gs://grow-with-stickers.appspot.com");
    final ref = _fs
        .ref()
        // .child("book_1_numbers/cover.png");
        .child(extractPath(imagePath));
    final urlImage = await ref.getDownloadURL();
    return urlImage;
  }
}

String extractPath(String imagePath) {
  final String prefix = 'gs://grow-with-stickers.appspot.com/';
  if (imagePath.startsWith(prefix)) {
    return imagePath.substring(prefix.length);
  } else {
    // Handle cases where the imagePath doesn't start with the expected prefix
    throw ArgumentError('Invalid imagePath format');
  }
}