const String tableCard = 'Card';

class CardDetailsField{
  static final List<String> values = [
    id,
    isMyCard,
    companyName,
    jobTitle,
    username,
    phoneNumber,
    email,
    cardDetails,
    cardImage,
    date
  ];

  static String id = '_id';
  static String isMyCard = 'isMyCard';
  static String companyName = 'companyName';
  static String jobTitle = 'jobTitle';
  static String username = 'username';
  static String phoneNumber = 'phoneNumber';
  static String email = 'email';
  static String cardDetails = 'cardDetails';
  static String cardImage = 'cardImage';
  static String date = 'date';
}

class CardDetails{
  int? id;
  int? isMyCard = 0;
  String? companyName;
  String? jobTitle;
  String? username;
  String? phoneNumber;
  String? email;
  String? cardDetails;
  String? cardImage;
  String? date;

  CardDetails({
    this.id,
    this.isMyCard,
    this.companyName,
    this.jobTitle,
    this.username,
    this.phoneNumber,
    this.email,
    this.cardDetails,
    this.cardImage,
    this.date
  });

  static CardDetails fromJson(Map<String, Object?> json) => CardDetails(
    id: json[CardDetailsField.id] as int,
    isMyCard: json[CardDetailsField.isMyCard] as int,
    companyName: json[CardDetailsField.companyName] as String,
    jobTitle: json[CardDetailsField.jobTitle] as String,
    username: json[CardDetailsField.username] as String,
    phoneNumber: json[CardDetailsField.phoneNumber] as String,
    email: json[CardDetailsField.email] as String,
    cardDetails: json[CardDetailsField.cardDetails] as String,
    cardImage: json[CardDetailsField.cardImage] as String,
    date: json[CardDetailsField.date] as String,
  );

  Map<String, Object> toMap(){
    return {
      CardDetailsField.id: id ?? '',
      CardDetailsField.isMyCard: isMyCard ?? 0,
      CardDetailsField.companyName: companyName ?? '',
      CardDetailsField.jobTitle: jobTitle ?? '',
      CardDetailsField.username: username ?? '',
      CardDetailsField.phoneNumber: phoneNumber ?? '',
      CardDetailsField.email: email ?? '',
      CardDetailsField.cardDetails: cardDetails!,
      CardDetailsField.cardImage: cardImage!,
      CardDetailsField.date: date!,
    };
  }
}