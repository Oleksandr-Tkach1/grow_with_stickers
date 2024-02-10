import 'models/book.dart';
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
    CREATE TABLE $tableCard ( 
      ${CardDetailsField.id} $idType, 
      ${CardDetailsField.isMyCard} $intType,
      ${CardDetailsField.companyName} $textType
    )
  ''');
  }

  Future<int> saveCard(CardDetails value) async {
    final db = await instance.database;
    final id = await db.insert(tableCard, value.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> saveMyCard(CardDetails value) async {
    final db = await instance.database;
    final existingCard = await db.query(
      tableCard,
      where: '${CardDetailsField.isMyCard} = ?',
      whereArgs: [1],
    );
    if (existingCard.isNotEmpty && value.isMyCard == 1) {
      final result = await db.update(
        tableCard,
        value.toMap(),
        where: '${CardDetailsField.isMyCard} = ?',
        whereArgs: [1],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return result;
    } else {
      final id = await db.insert(
        tableCard,
        value.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return id;
    }
  }

  Future<List<CardDetails>> getCards() async {
    final db = await instance.database;
    final List<Map<String, Object?>> queryResult = await db.query(tableCard, columns: CardDetailsField.values);
    List<CardDetails> cardList = queryResult.map((json) => CardDetails.fromJson(json)).toList();
    cardList.sort((a, b) {
      if (a.isMyCard == 1 && b.isMyCard == 0) {
        return -1;
      } else if (a.isMyCard == 0 && b.isMyCard == 1) {
        return 1;
      } else {
        return b.date!.compareTo(a.date!);
      }
    });
    return cardList;
  }


  Future<CardDetails?> getMyCard() async {
    final db = await instance.database;
    final List<Map<String, Object?>> queryResult = await db.query(tableCard,
      columns: CardDetailsField.values,
      orderBy: 'date DESC',
      where: '${CardDetailsField.isMyCard} = ?', whereArgs: [1]);
    if (queryResult.isNotEmpty) {
      return CardDetails.fromJson(queryResult.first);
    } else {
      return null;
    }
  }

  Future<int> updateCardDetails(int id, String cardDetails) async {
    final db = await instance.database;
    final userData = {'cardDetails': cardDetails};
    final result = await db.update(tableCard, userData, where: '${CardDetailsField.id} = ?', whereArgs: [id]);
    return result;
  }

  Future<int> updateCardPathImage(int id, String imagePath) async {
    final db = await instance.database;
    final userData = {'cardImage': imagePath};
    final result = await db.update(tableCard, userData, where: '${CardDetailsField.id} = ?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteCard(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableCard,
      where: '${CardDetailsField.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTablesInDatabase() async {
    await _database!.delete(tableCard);
    return;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}