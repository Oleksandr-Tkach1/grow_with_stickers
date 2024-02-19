import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/models/response/book/book.dart';

class FirebaseDatabase {
  Future<List<Book>> getBooks() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    List<Book> books = [];
    QuerySnapshot<Map<String, dynamic>> booksSnapshot =
        await _db.collection('books').get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> bookDoc
        in booksSnapshot.docs) {
      Map<String, dynamic> bookData = bookDoc.data();
      List<Map<String, dynamic>> stickers = [];
      List<Map<String, dynamic>> pages = [];

      QuerySnapshot<Map<String, dynamic>> stickersSnapshot = await _db
          .collection('books')
          .doc(bookDoc.id)
          .collection('stickers')
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in stickersSnapshot.docs) {
        Map<String, dynamic> stickerData = doc.data();
        stickers.add(stickerData);
      }

      QuerySnapshot<Map<String, dynamic>> pagesSnapshot = await _db
          .collection('books')
          .doc(bookDoc.id)
          .collection('pages')
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in pagesSnapshot.docs) {
        Map<String, dynamic> pageData = doc.data();
        pages.add(pageData);
      }

      books.add(Book.fromJson({
        ...bookData,
        'stickers': stickers,
        'pages': pages,
      }));
    }

    return books;
  }
}