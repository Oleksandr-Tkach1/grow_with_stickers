import 'package:grow_with_stickers/data/SQLite/entity/sticker_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../network/services/firebase/firebase_database.dart';
import '../SQLite/SQLite_service.dart';
import '../SQLite/entity/book_entity.dart';
import '../SQLite/entity/page_entity.dart';
import '../SQLite/utils/model_mapper.dart';

class BookRepositoryImpl {
  final SqliteService _sqliteService;
  final ModelMapper _modelMapper;
  final FirebaseDatabase _databaseMethods;

  BookRepositoryImpl(this._sqliteService, this._modelMapper, this._databaseMethods);

  Future<void> fetchBooks() async {
    // var books = await _databaseMethods.getBooks();
    // var booksModel = await _modelMapper.mapBook(books);
    // await _sqliteService.saveBook(booksModel);

    var books = await _databaseMethods.getBooks();
    // var books = remoteDataSource.getBooks()
    // nignee govno transfer to localDataSource.saveBooks(booksEntity)
    final db = await _sqliteService.database;
    var booksEntity = await _modelMapper.mapBook(books);


    // for (final book in booksEntity) {
    //   final existingBooks = await db.query(
    //     tableBooks,
    //     where: '${BookEntityField.productId} = ?',
    //     whereArgs: [book.productId],
    //   );
    //   if (existingBooks.isNotEmpty) {
    //     await db.update(
    //       tableBooks,
    //       book.toMap(),
    //       where: '${BookEntityField.productId} = ?',
    //       whereArgs: [book.productId],
    //     );
    //   } else {
    //     await db.insert(
    //       tableBooks,
    //       book.toMap(),
    //       conflictAlgorithm: ConflictAlgorithm.replace,
    //     );
    //   }
    //   if (book.page != null) {
    //     for (final page in book.page!) {
    //       await db.insert(
    //         tablePages,
    //         page.toMap(book.productId!),
    //         conflictAlgorithm: ConflictAlgorithm.replace,
    //       );
    //     }
    //   }
    //   if (book.sticker != null) {
    //     for (final sticker in book.sticker!) {
    //       await db.insert(
    //         tableStickers,
    //         sticker.toMap(book.productId!),
    //         conflictAlgorithm: ConflictAlgorithm.replace,
    //       );
    //     }
    //   }
    // }


    // Clear existing entries
    if (booksEntity.isNotEmpty) {
      await db.delete(tableBooks);
      await db.delete(tablePages);
      await db.delete(tableStickers);
      for (final book in booksEntity) {
        final existingBooks = await db.query(
          tableBooks,
          where: '${BookEntityField.productId} = ?',
          whereArgs: [book.productId],
        );
        if (existingBooks.isNotEmpty) {
          await db.update(
            tableBooks,
            book.toMap(),
            where: '${BookEntityField.productId} = ?',
            whereArgs: [book.productId],
          );
        } else {
          await db.insert(
            tableBooks,
            book.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        if (book.page != null) {
          for (final page in book.page!) {
            await db.insert(
              tablePages,
              page.toMap(book.productId!),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }
        if (book.sticker != null) {
          for (final sticker in book.sticker!) {
            await db.insert(
              tableStickers,
              sticker.toMap(book.productId!),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }
      }
    }
  }
}