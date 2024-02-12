import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getBooks() async {
    return await _firebaseFirestore
        .collection('books')
        .get();
  }
}