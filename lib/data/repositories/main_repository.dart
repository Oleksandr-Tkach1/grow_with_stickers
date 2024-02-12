import 'package:cloud_firestore/cloud_firestore.dart';

import '../../network/services/firebase/firebase_database.dart';
import '../SQLite/SQLite_service.dart';
import '../SQLite/models/book.dart';

class CardRepository{
  final FirebaseDatabase _databaseMethods;
  final SqliteService _sqliteService;
  CardRepository(this._sqliteService, this._databaseMethods);

  Future<void> saveBooksToDatabase(cardModel) async{
    await _sqliteService.saveCard(cardModel);
  }

  // Future<List<Books?>> getBooks() async{
  //   List<Books?> listRoom = [];
  //   Map<String, dynamic> rooms = {};
  //   var document = await _databaseMethods.getBooks();
  //   for (QueryDocumentSnapshot<Map<String, dynamic>> document in document.docs) {
  //     rooms = document.data();
  //     listRoom.add(Books.fromFirestore(rooms));
  //   }
  //   return listRoom;
  // }
}