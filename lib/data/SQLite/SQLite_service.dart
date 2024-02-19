import 'package:grow_with_stickers/data/SQLite/entity/book_entity.dart';
import 'package:grow_with_stickers/data/SQLite/entity/page_entity.dart';
import 'package:grow_with_stickers/data/SQLite/entity/sticker_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static final SqliteService instance = SqliteService._init();
  static Database? _database;
  SqliteService._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }else{
      _database = await _initDB('Books.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final String dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const intType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE $tableBooks ( 
      ${BookEntityField.titleRu} $textType, 
      ${BookEntityField.coverUrl} $textType,
      ${BookEntityField.productId} $textType,
      ${BookEntityField.titleUa} $textType,
      ${BookEntityField.free} $intType,
      ${BookEntityField.category} $textType,
      ${BookEntityField.title} $textType
    )
  ''');
    await db.execute('''
          CREATE TABLE $tablePages (
            id $idType,
            bookProductId TEXT,
            ${PageEntityField.titleRu} $textType,
            ${PageEntityField.taskRu} $textType,
            ${PageEntityField.task} $textType,
            ${PageEntityField.payload} $textType,
            ${PageEntityField.backgroundUrl} $textType,
            ${PageEntityField.titleUa} $textType,
            ${PageEntityField.taskUa} $textType,
            ${PageEntityField.title} $textType,
            FOREIGN KEY(bookProductId) REFERENCES books(productId)
          )
        ''');
    await db.execute('''
          CREATE TABLE $tableStickers (
            id $idType,
            bookProductId TEXT,
            ${StickerEntityField.coverUrl} $textType,
            FOREIGN KEY(bookProductId) REFERENCES books(productId)
          )
        ''');
  }

  // Future<void> saveBook(List<BookEntity> books) async {
  //   final db = await database;
  //   for (final book in books) {
  //     final existingBooks = await db.query(
  //       tableBooks,
  //       where: '${BookEntityField.productId} = ?',
  //       whereArgs: [book.productId],
  //     );
  //     if (existingBooks.isNotEmpty) {
  //       await db.update(
  //         tableBooks,
  //         book.toMap(),
  //         where: '${BookEntityField.productId} = ?',
  //         whereArgs: [book.productId],
  //       );
  //     } else {
  //       await db.insert(
  //         tableBooks,
  //         book.toMap(),
  //         conflictAlgorithm: ConflictAlgorithm.replace,
  //       );
  //     }
  //     if (book.page != null) {
  //       for (final page in book.page!) {
  //         await db.insert(
  //           tablePages,
  //           page.toMap(book.productId!),
  //           conflictAlgorithm: ConflictAlgorithm.replace,
  //         );
  //       }
  //     }
  //     if (book.sticker != null) {
  //       for (final sticker in book.sticker!) {
  //         await db.insert(
  //           tableStickers,
  //           sticker.toMap(book.productId!),
  //           conflictAlgorithm: ConflictAlgorithm.replace,
  //         );
  //       }
  //     }
  //   }
  // }

  Future<List<BookEntity>> getBooks() async {
    final db = await database;
    final booksData = await db.query(tableBooks);
    final books = <BookEntity>[];
    for (final bookData in booksData) {
      final pagesData = await db.query(
        tablePages,
        where: 'bookProductId = ?',
        whereArgs: [bookData['productId']],
      );
      final stickersData = await db.query(
        tableStickers,
        where: 'bookProductId = ?',
        whereArgs: [bookData['productId']],
      );
      final pages = pagesData.map((data) => PageEntity.fromMap(data)).toList();
      final stickers =
      stickersData.map((data) => StickerEntity.fromMap(data)).toList();
      books.add(
        BookEntity(
          page: pages,
          sticker: stickers,
          titleRu: bookData['titleRu'] as String,
          coverUrl: bookData['coverUrl'] as String,
          productId: bookData['productId'] as String,
          titleUa: bookData['titleUa'] as String,
          free: bookData['free'] == 1,
          category: bookData['category'] as String,
          title: bookData['title'] as String,
        ),
      );
    }
    return books;
  }
}