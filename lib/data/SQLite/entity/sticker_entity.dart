const String tableStickers = 'Stickers';

class StickerEntityField{
  static final List<String> values = [
    coverUrl,
  ];

  static String coverUrl = 'coverUrl';
}

class StickerEntity {
  final String coverUrl;

  StickerEntity({
    required this.coverUrl,
  });

  Map<String, dynamic> toMap(String bookProductId) {
    return {
      'bookProductId': bookProductId,
      'coverUrl': coverUrl,
    };
  }

  factory StickerEntity.fromMap(Map<String, dynamic> map) {
    return StickerEntity(
      coverUrl: map['coverUrl'],
    );
  }
}