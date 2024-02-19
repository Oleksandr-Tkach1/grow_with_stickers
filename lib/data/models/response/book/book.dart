import 'package:grow_with_stickers/data/models/response/book/page.dart';
import 'package:grow_with_stickers/data/models/response/book/sticker.dart';

class Book {
  List<Page>? page;
  List<Sticker>? sticker;
  String? titleRu;
  String? coverUrl;
  String? productId;
  String? titleUa;
  bool? free;
  String? category;
  String? title;

  Book({
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

  Book.fromJson(dynamic json) {
    if (json['pages'] != null) {
      print(json['pages']);
      page = [];
      json['pages'].forEach((v) {
        page!.add(Page.fromJson(v));
      });
    }
    if (json['stickers'] != null) {
      sticker = [];
      json['stickers'].forEach((v) {
        sticker!.add(Sticker.fromJson(v));
      });
    }

    titleRu = json['title_ru'];
    coverUrl = json['cover_url'];
    productId = json['product_id'];
    titleUa = json['title_ua'];
    free = json['free'];
    category = json['category'];
    title = json['title'];
  }
}