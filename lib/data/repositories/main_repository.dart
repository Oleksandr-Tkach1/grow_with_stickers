import '../SQLite/SQLite_service.dart';
import '../SQLite/models/book.dart';

class CardRepository{
  final SqliteService _sqliteService;
  CardRepository(this._sqliteService);

  Future<void> saveCardToDatabase(cardModel) async{
    await _sqliteService.saveCard(cardModel);
  }

  Future<void> saveMyCardToDatabase(cardModel) async{
    await _sqliteService.saveMyCard(cardModel);
  }

  Future<List<CardDetails>> getListCardFromDatabase() async{
    var listCard = await _sqliteService.getCards();
    return listCard;
  }

  Future<CardDetails?> getMyCardFromDatabase() async{
    var cardDetails = await _sqliteService.getMyCard();
    return cardDetails;
  }

  Future<void> updateCardDetailsToDatabase(id, cardDetails) async{
    await _sqliteService.updateCardDetails(id, cardDetails);
  }

  Future<void> updateCardImageToDatabase(id, cardImagePath) async{
    await _sqliteService.updateCardPathImage(id, cardImagePath);
  }
}