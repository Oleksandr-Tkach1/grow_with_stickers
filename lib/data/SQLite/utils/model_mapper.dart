import 'package:smartstruct/smartstruct.dart';
import '../models/book.dart';

@mapper
abstract class Mapper{
  CardDetails mapCardDetails(String cardDetails, String cardImage);
}

class ModelMapper extends Mapper {

  @override
  CardDetails mapCardDetails(String cardDetails, String cardImage, [int? isMyCard, String? companyName, String? jobTitle, String? username, String? phoneNumber, String? email]) {
    final DateTime currentDate = DateTime.now();
    final formattedDate = currentDate.toLocal().toString();
    var id = DateTime.now().millisecondsSinceEpoch;
    final model = CardDetails(
      id: id,
      isMyCard: isMyCard ?? 0,
      companyName: companyName,
      jobTitle: jobTitle,
      username: username,
      phoneNumber: phoneNumber,
      email: email,
      cardDetails: cardDetails,
      cardImage: cardImage,
      date: formattedDate
    );
    return model;
  }
}