import 'package:grow_with_stickers/data/SQLite/entity/page_entity.dart';
import 'package:grow_with_stickers/data/SQLite/entity/sticker_entity.dart';

const String tableBooks = 'Book';

class BookEntityField{
  static final List<String> values = [
    titleRu,
    coverUrl,
    productId,
    titleUa,
    free,
    category,
    title,
  ];

  static String titleRu = 'titleRu';
  static String coverUrl = 'coverUrl';
  static String productId = 'productId';
  static String titleUa = 'titleUa';
  static String free = 'free';
  static String category = 'category';
  static String title = 'title';
}

class BookEntity {
  List<PageEntity>? page;
  List<StickerEntity>? sticker;
  String? titleRu;
  String? coverUrl;
  String? productId;
  String? titleUa;
  bool? free;
  String? category;
  String? title;

  BookEntity({
    required this.page,
    required this.sticker,
    required this.titleRu,
    required this.coverUrl,
    required this.productId,
    required this.titleUa,
    required this.free,
    required this.category,
    required this.title,
  });

  BookEntity.fromJson(dynamic json) {
    if (json['pages'] != null) {
      print(json['pages']);
      page = [];
      json['pages'].forEach((v) {
        page!.add(PageEntity.fromMap(v));
      });
    }
    if (json['stickers'] != null) {
      sticker = [];
      json['stickers'].forEach((v) {
        sticker!.add(StickerEntity.fromMap(v));
      });
    }

    titleRu = json['title_ru'];
    coverUrl = json['cover_url'];
    productId = json['product_id'] as String ?? '';
    titleUa = json['title_ua'];
    free = json['free'];
    category = json['category'];
    title = json['title'];
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'titleRu': titleRu,
      'coverUrl': coverUrl,
      'titleUa': titleUa,
      'free': free == true ? 1 : 0,
      'category': category,
      'title': title,
    };
  }
}